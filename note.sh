#!/bin/bash

echo "Welcome to the note taker app 100000"
echo

Help()
{
    # Display Help
    echo "Commands for note taking" 
    echo
    echo "options:"
    echo "note add use \"Your note text here\"        Add a note"
    echo "note list                                   List all notes"
    echo "note search \"keyword\"                     Search for keyword"
}

# Get options for help.
while getopts ":h" option; do
    case $option in
        h) # Display Help
            Help
            exit;;
        \?) # Error
            echo "Error: for help, use -h"
            exit;;
    esac
done


# Add a note function.
if [ $1 == "note add" ]; then 
    if [ -n $2 ]; then
        echo "$(date +'%Y-%m-%d_%H-%M-%S') - $2" >> notes.txt
        echo "Note has been added"
    else
        echo "Error: note text not found"
        Help
    fi
fi

# List all notes function.
if [ $1 == "list" ]; then
    if [ -s "notes.txt"]; then
        cat notes.txt
        echo exit 0
    else
        echo "No notes found"
        echo exit 1
    fi
fi

# Search for keywords function.
if [ $1 == "search"]; then
    if [ -n $2]; then
        grep -i "$2" notes.txt
    else 
        echo "Error: No notes found with keyword"
        Help
        echo exit 1
    fi
fi


