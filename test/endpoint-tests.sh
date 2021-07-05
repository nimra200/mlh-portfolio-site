#!/bin/bash
curl --request POST 'www.nimra-mlh-portfolio.duckdns.org/register' --silent | grep 'Username is required.' &> /dev/null

if [ $? -eq 0 ]
then
	echo "Tested no username -- OK "
else
	echo "Tested no username -- BAD"
fi

curl -X  POST -d "username=nimra" 'www.nimra-mlh-portfolio.duckdns.org/register' --silent | grep 'Password is required.' &> /dev/null

if [ $? -eq 0 ]
then
	echo 'Tested no password -- OK '
else
	echo 'Tested no password -- BAD '
fi

curl -X  POST -d "username=nimra.af&password=123" 'www.nimra-mlh-portfolio.duckdns.org/register' --silent | grep 'User nimra.af created successfully.' &> /dev/null

if [ $? -eq 0 ]
then
	echo 'Tested username + password -- OK '
else
	echo 'Tested username + password -- BAD '
fi

curl -X  POST -d "username=nimra&password=123" 'www.nimra-mlh-portfolio.duckdns.org/register' --silent | grep 'User nimra is already registered.' &> /dev/null

if [ $? -eq 0 ]
then
	echo 'Tested same user twice -- OK '
else
	echo 'Tested same user twice -- BAD'
fi
