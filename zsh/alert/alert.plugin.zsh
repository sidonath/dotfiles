function alert {
	if (( $? == 0 )) then
		say -v Karen 'successfully done'
	else
		say -v Fred 'failed'
	fi
}
