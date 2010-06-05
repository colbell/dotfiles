# Print current volume.
# From http://ismith.scripts.mit.edu/snarkblog/2010/06/02/xmonad-actions-volume/
amixer get Master | tail -n 1 | cut -d ' ' -f7,8 | sed -e 's/\[//g' -e 's/\]//g' | awk '{if ($2=="off") {print "MM"} else {print $1}}'

