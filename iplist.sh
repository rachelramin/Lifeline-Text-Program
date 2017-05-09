#!/bin/bash

# If file is not found, then say so, and create the file
if [ ! -f ~/.previousexternaladdr ]; then
    echo "No Previous External IP Recorded" > ~/.previousexternaladdr
fi
if [ ! -f ~/.previousinternaladdr ]; then
    echo "No Previous Internal IP Recorded" > ~/.previousinternaladdr
fi

# Line break
echo

# Stores current external ip into file using ipecho.net service
echo "Current External IP: "
curl -s ipecho.net/plain > ~/.externaladdr
# Prints file with external ip stored in it
cat ~/.externaladdr
echo

# Line break
echo

# Stpred current local ip into file using native mac command on the interface en0 (default)
echo "Current Local IP: "
ipconfig getifaddr en0 > ~/.internaladdr
# Prints file with internal ip stored in it
cat ~/.internaladdr
echo

# Prints external ip that was generated last time the script was run
echo "Previous External IP: "
cat ~/.previousexternaladdr
echo

# Line break
echo

# Prints local ip that was generated last time the script was run
echo "Previous Local IP: "
cat ~/.previousinternaladdr
echo

# Moves and replaces current ip to last ip
mv ~/.externaladdr ~/.previousexternaladdr
mv ~/.internaladdr ~/.previousinternaladdr
