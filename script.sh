#!/bin/bash

ssh Lifeline@REDACTED "bash -s" << EOF
	shopt -s expand_aliases;
	source .bashrc
	sendsms;
EOF
exit
