## Useful Tools
```bash
broot # or br : helps you navigate directories
rg "some text" -t py folder # rip grep : cooler grep
rg -u --files-without-match "^#\!" -t sh
tldr # too long didn't read : summarized and practical man pages
shellcheck # better errors
convert image.png image.jpg # from ImageMagick
locate "*pdf" # find files quic
```

## Shell Scripting
```bash
######### Variables
foo=bar
echo $foo
foo = bar # won't work!

######### OUTPUT
echo "hello"
echo 'hello'
echo "value is $foo" # value is bar
echo 'value is $foo' # value is $foo
foo=$(pwd)
echo "path: $foo"
echo "path: $(pwd)"

######### $$$$$$$$$$
"$1" # first argument
$_ # the previously used argument
$? # 1 means didn't work ; 0 means something went wrong
$# # number of argument
$@ # list of all arguments
for file in "$@"; do

######### Tips & Tricks
sudo !! # will replace !! with the previous command
false || echo "error" # error
true || echo "error"
touch file{,1,2,3} # <=> touch file1 file2 file3
wslview test.png

######### Shebang
#!/usr/local/bin/python
#!usr/bin/env python  # this makes it more portable


######### Dealing with files and text
find . -name sourceFolder -type d
find -name "*.pdf" -type f -exec rm {} \;
# the pipe redirects STDOUT to STDIN, but sometimes
# some commands don't need STDIN, and only accept an argument
# xargs helps in that case
find . -name "*.pdf" | xargs zip -r result.zip
# a file exists and is not empty.
if [ ! -s links.html ]; then ...
grep word file
grep -R word file # recursive

######### Standard Error Tips
$? # 1 means didn't work ; 0 means something went wrong
which ruby > /dev/null 2> /dev/null
if ! [ $? -eq 0 ]; then
    echo "Ruby is not installed. Please install Ruby first."
    exit 1
fi
```
