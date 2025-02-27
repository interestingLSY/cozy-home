import argparse

if __name__ == '__main__':
	for command in ['pip', 'python', 'conda', 'run', 'exec', 'bash']:
		print(f'Generating {command}')

		extra_args = ''
		if command == 'pip':
			extra_args = '--proxy=$DS_PROXY'
		
		function_name = f'he{command}'
		if command == 'python':
			function_name = 'hepy'
		
		should_prepend_hfai = command in ['python', 'exec', 'run', 'bash']
		prepend_env_vars = ''
		if command == 'conda':
			prepend_env_vars = 'CONDARC=/home/liushengyu/.condarc '

		function = f"""# {function_name} - Run {command} commands in the current he environment
function {function_name} --description 'Run {command} commands in the current he environment'
	if test -z "$HF_ENV_NAME"
		echo "No environment set. Please use 'he <env>' to activate an environment."
		return 1
	end

	if test -z "$argv"
		echo "No packages specified."
		return 1
	end

	echo "[HEENV] Running {command} command {command} `$argv` in $HF_ENV_NAME"

	set -l HAIENV_ARGS $HF_ENV_NAME
	if test -n "$HF_ENV_OWNER"
		set -l HAIENV_ARGS $HAIENV_ARGS -u $HF_ENV_OWNER
	end

	set -l CMDLINE "source haienv $HAIENV_ARGS && {prepend_env_vars}{'hfai ' if should_prepend_hfai else ''}{command} {extra_args} $argv && echo '[HEENV] Successfully executed \\"{command} $argv\\"'"
	echo "[HEENV] Running command: $CMDLINE"
	bash -c "$CMDLINE"
end
		"""
	
		with open(f'./{function_name}.fish', 'w') as f:
			f.write(function)

