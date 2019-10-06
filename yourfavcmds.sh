history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s "" -t | sort -nr | nl | head -n5
#replce -n5 with your own number!
