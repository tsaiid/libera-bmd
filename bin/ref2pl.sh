#!/bin/sh

/usr/bin/sed "s/\`ReferenceCurve\`/\`Reference_Curves\`/g" $1 \
| /usr/bin/tr "[:upper:]" "[:lower:]"