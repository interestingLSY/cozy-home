function pip3 --description 'Override `pip3`'
	echo "[HEENV] Please use 'hepip' instead of 'pip3' to install packages in the current he environment."
	echo "[HEENV] Type 'Y' to continue with 'pip3' or 'N' to cancel."
	read -l -P "[HEENV] Continue with 'pip'? [Y/n] " -n 1 -s CONTINUE
	if test "$CONTINUE" = "Y"
		command pip $argv
	else
		echo "[HEENV] Aborted."
	end
end
