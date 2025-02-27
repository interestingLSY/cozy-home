function conda --description 'Override `conda`'
	echo "[HEENV] Please use 'heconda' instead of 'conda' to install packages in the current he environment."
	echo "[HEENV] Type 'Y' to continue with 'pcondap' or 'N' to cancel."
	read -l -P "[HEENV] Continue with 'conda'? [Y/n] " -n 1 -s CONTINUE
	if test "$CONTINUE" = "Y"
		command conda $argv
	else
		echo "[HEENV] Aborted."
	end
end
