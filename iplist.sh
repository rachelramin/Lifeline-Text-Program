#!/bin/bash

if [ ! -f ~/.previousexternaladdr ]; then
    echo "No Previous External IP Recorded" > ~/.previousexternaladdr
fi

if [ ! -f ~/.previousinternaladdr ]; then
    echo "No Previous Internal IP Recorded" > ~/.previousinternaladdr
fi

echo

echo "Current External IP: "
curl -s ipecho.net/plain > ~/.externaladdr
cat ~/.externaladdr
echo

echo

echo "Current Local IP: "
ipconfig getifaddr en0 > ~/.internaladdr
cat ~/.internaladdr
echo

echo "Previous External IP: "
cat ~/.previousexternaladdr
echo

echo

echo "Previous Local IP: "
cat ~/.previousinternaladdr
echo

mv ~/.externaladdr ~/.previousexternaladdr
mv ~/.internaladdr ~/.previousinternaladdr
