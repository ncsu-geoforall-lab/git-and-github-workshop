#!/bin/bash

# builds pages from source

function build_page {
    FILE_SOURCE=$1
    FILE_TARGET=$2
    cat $HEAD_FILE > $OUTDIR/$FILE_TARGET
    echo "<!-- This is a generated file. Do not edit. -->" >> $OUTDIR/$FILE_TARGET
    cat $FILE_SOURCE >> $OUTDIR/$FILE_TARGET
    cat $FOOT_FILE >> $OUTDIR/$FILE_TARGET
}

function build_page_rst {
    FILE_SOURCE=$1
    FILE_TARGET=$2
    cat $HEAD_FILE > $OUTDIR/$FILE_TARGET
    echo "<!-- This is a generated file. Do not edit. -->" >> $OUTDIR/$FILE_TARGET
    pandoc --to=html $FILE_SOURCE >> $OUTDIR/$FILE_TARGET
    cat $FOOT_FILE >> $OUTDIR/$FILE_TARGET
}

HEAD_FILE=head.html
FOOT_FILE=foot.html

OUTDIR="../git-and-github-workshop-pages"

# disable Jekyll which is not needed
touch $OUTDIR/.nojekyll

if [ ! -d "$OUTDIR" ]; then
    echo "The directory $OUTDIR does not exists and it will be created for you."
    mkdir $OUTDIR
fi

for FILE in `ls *.rst|grep -v foot|grep -v head`
do
    build_page_rst $FILE `basename --suffix=.rst $FILE`.html
done

for FILE in `ls *.html|grep -v foot|grep -v head`
do
    build_page $FILE $FILE
done

for FILE in *.css
do
    cp $FILE $OUTDIR
done

for DIR in img
do
    cp -r $DIR $OUTDIR
done
