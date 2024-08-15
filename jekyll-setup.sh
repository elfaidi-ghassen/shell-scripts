#!/bin/bash

# Create directory structure
mkdir _includes _layouts _posts assets
cd assets
mkdir fonts images styles scripts

# Download normalize.css
cd styles
# -0 : current directory
curl -O https://necolas.github.io/normalize.css/8.0.1/normalize.css

# Create empty CSS and JS files
touch main.css
cd ../scripts
touch main.js

# Go back to the root directory
cd ../..

# Update _includes/links.html with useful links
if [ ! -s _includes/links.html ]; then
	echo '<link rel="stylesheet" href="{{ "assets/styles/main.css" | relative_url }}">' >> _includes/links.html
	echo '<link rel="stylesheet" href="{{ "assets/styles/normalize.css" | relative_url }}">' >> _includes/links.html
	echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>' >> _includes/links.html
	echo '<link rel="icon" type="image/png" href="{{ "assets/images/favicon.ico" | relative_url }}">' >> _includes/links.html
fi
# Install Jekyll and Bundler if not installed

# quit if ruby is not installed
# return the path where ruby exists, else return a non zero value <=> error
# the error is redirected to /dev/null
which ruby > /dev/null 2> /dev/null
if ! [ $? -eq 0 ]; then
    echo "Ruby is not installed. Please install Ruby first."
    exit 1
fi

# check if bundler is installed: -i for installed
which bundler > /dev/null 2> /dev/null
if ! [ $? -eq 0 ];
then
	echo "installing bundler..."
    gem install bundler
fi

which jekyll > /dev/null 2> /dev/null
if ! [ $? -eq 0 ];
then
	echo "installing Jekyll..."
    gem install jekyll
fi

if [ ! -f Gemfile ]; then
	bundle init
	echo 'gem "jekyll"' >> Gemfile;
	bundle
fi;

touch index.html;
