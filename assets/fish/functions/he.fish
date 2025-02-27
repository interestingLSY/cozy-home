# he <env> - change to the specified environment
# It set the variable HF_ENV_NAME to argv[1], and set the variable HF_ENV_OWNER to argv[2]
function he --description 'Change to the specified environment'
	if test -n "$argv[1]"
		set -g -x HF_ENV_NAME $argv[1]
		if test -n "$argv[2]"
			set -g -x HF_ENV_OWNER $argv[2]
			echo "Setting environment to $HF_ENV_OWNER/$HF_ENV_NAME"
		else
			echo "Setting environment to $HF_ENV_NAME"
			set -e HF_ENV_OWNER
		end
	else
		echo "Resetting environment"
		set -e HF_ENV_NAME
		set -e HF_ENV_OWNER
	end
	return 0
end
