# hepy - Run python commands in the current he environment
function hepy --description 'Run python commands in the current he environment'
	if test -z "$HF_ENV_NAME"
		echo "No environment set. Please use 'he <env>' to activate an environment."
		return 1
	end

	if test -z "$argv"
		echo "No packages specified."
		return 1
	end

	echo "[HEENV] Running python command python `$argv` in $HF_ENV_NAME"

	set -l HAIENV_ARGS $HF_ENV_NAME
	if test -n "$HF_ENV_OWNER"
		set -l HAIENV_ARGS $HAIENV_ARGS -u $HF_ENV_OWNER
	end

	set -l CMDLINE "source haienv $HAIENV_ARGS && hfai python  $argv && echo '[HEENV] Successfully executed \"python $argv\"'"
	echo "[HEENV] Running command: $CMDLINE"
	bash -c "$CMDLINE"
end
		