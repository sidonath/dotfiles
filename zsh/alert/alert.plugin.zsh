function alert {
	if (( $? == 0 )) then
		say -v trinoids 'successfully done'
	else
		say -v bad 'failed'
	fi
}
