#!/bin/bash

# If file is not found, record that previous ips do not exist, and create the files
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
# Prints file with external IP stored in it
cat ~/.externaladdr
# Line break
echo

# Line break
echo

# Stores current local ip into file using native mac command on the interface en0 (default)
echo "Current Local IP: "
ipconfig getifaddr en0 > ~/.internaladdr
# Prints file with internal ip stored in it
cat ~/.internaladdr
# Line break
echo

# init rant

# Not gonna lie, this shit is weird.
# So I was having this problem where I would get an extra line break (or not enough) depending on the circumstance.
# After hours of trial and error, I find that this fixes the problem.
# I realize this is a conditional which is always true. It's illogical.
# Ask bash devs why this works, because I really don't know. But it does!

# Prints external ip that was generated last time the script was run
echo "Previous External IP: "
a=`cat ~/.previousexternaladdr`
echo $a

    echo "No Previous External IP Recorded" > ~/.linefixi
    # Prints file with external IP (or lack thereof) stored in it
    b=`cat ~/.linefix`

    if [ "$a" != "$b" ]; then
        echo
    else
        echo
    fi

# Prints local ip that was generated last time the script was run
echo "Previous Local IP: "
cat ~/.previousinternaladdr
# Line break
echo

# Stores new current ip as previous in preparation for the next execution
mv ~/.externaladdr ~/.previousexternaladdr
mv ~/.internaladdr ~/.previousinternaladdr

# Remove junk involved with line break fix
rm -rf ~/.linefix
