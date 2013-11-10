#!/bin/sh

/usr/bin/python mdb2sqlite.py $1 \
| /usr/bin/sed "s/\`ReferenceCurve\`/\`Reference_Curves\`/g" \
| /usr/bin/perl -pe "s/\`([A-Z_a-z0-9]+)\`/\`\L\1\`/g"