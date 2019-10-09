#!/bin/bash

GithubShow() {
	search=""
	echo "Showing Github results for : $@"
    	for term in $@; do
        	search="$search+$term"
    	done
    	xdg-open "http://github.com/search?q=$search"
}

GithubShow $1
