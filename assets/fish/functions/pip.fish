function pip --description 'Override `pip`'
	echo "[HEENV] Please use 'hepip' instead of 'pip' to install packages in the current he environment."
	echo "[HEENV] Type 'Y' to continue with 'pip' or 'N' to cancel."
	read -l -P "[HEENV] Continue with 'pip'? [Y/n] " -n 1 -s CONTINUE
	if test "$CONTINUE" = "Y"
		command pip $argv
	else
		echo "[HEENV] Aborted."
	end
end
