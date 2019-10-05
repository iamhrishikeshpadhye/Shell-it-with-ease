#!/bin/bash

website=""
Google() {
    search=""
    echo "Opening Google search for : $@"
    for term in $@; do
        search="$search%20$term"
    done
    website="http://www.google.com/search?q=$search"
}

newtab() {
	case $1 in
		Google | google)
			website="https://www.google.com"
			;;
		Gmail | gmail)
			website="https://www.gmail.com"
			;;
		Facebook | facebook)
			website="https://www.facebook.com"
			;;
		YouTube | youtube | Youtube)
			website="https://www.youtube.com"
			;;
		Kaggle | kaggle)
			website="https://www.kaggle.com"
			;;
		Github | github)
			website="https://www.github.com"
			;;
		LinkedIn | Linkedin | linkedin)
			website="https://www.linkedin.com"
			;;
		#You can add your own bookmarks!
		*)
			Google $1
	esac
	xdg-open $website
}

newtab "$1"

