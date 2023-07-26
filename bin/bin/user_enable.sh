#!/bin/sh

usage()
{
	echo "user-enable <user> <1/0>"
	exit 1
}

test_user()
{
	getent passwd $user >/dev/null 2>&1 && return 0
	echo "Invalid user: $user" >&2
	exit 1
}

test_enable()
{
	if [ "$enable" -eq 1 ] || [ "$enable" -eq 0 ]; then
		return 0
	fi
	echo "Invalid enable (pass 0 or 1): $enable" >&2
	exit 1
}

[ $# -eq 2 ] || usage
readonly user=$1
readonly enable=$2

test_user
test_enable
readonly sessions=$(loginctl list-sessions | awk "(\$3 == \"$user\") { print $1 }")

if [ "$enable" -eq 0 ]; then
	usermod -L $user
	for s in $sessions; do
		loginctl lock-session $s
	done
else
	usermod -U $user
fi
