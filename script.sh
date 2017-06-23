#!/bin/bash

# This file is executed by NSTask *task in LifelineView.m in LifelineWidget
# Three features other than opening the session: Enables bash alias expansion, sets bash alias source to .bashrc on server, and then sends an sms using the bash alias
ssh Lifeline@REDACTED "bash -s" << EOF
	shopt -s expand_aliases;
	source .bashrc
	sendsms;
EOF
exit
