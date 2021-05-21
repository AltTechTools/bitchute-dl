#!/bin/sh
#       Parameters:
# 1     Keep [Optiona] "keep" to keep the list

./_deleteNoVid.sh "keep"
./downloadmany.sh $(cat noVid.list) 

[ "$1" = "keep" ] || rm -f noVid.list
