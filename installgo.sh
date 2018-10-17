#!/bin/bash
set e

# Variables used in the installation. Please review before executing
GVERSION="1.11.1"
GFILE="go$GVERSION.linux-amd64.tar.gz"
GOPATH="$HOME/d_projects/go"
GOROOT="$HOME/d_projects/go/goroot"
TEMP_GO_DOWNLOAD="/temp_go_download"
TERMINAL_CONFIG_FILE=".bashrc"

# Checks if TMPDIR is set, sets for the script if not.
if [ -d $TMPDIR ]; then
    TMPDIR="$HOME/temp_go_download"
else
    echo "using $TEMPDIR to download gofile"
fi

# If GOROOT is in your env, skips folder creation for GOROOT and GOPATH and config file amending
if [ -d $GOROOT ]; then
    echo "Installation directory already exists $GOROOT"
    echo "Skipping setting \$GOROOT"
    echo "PLEASE NOTE: Also skipping setting required go configuratoin in your $TERMINAL_CONFIG_FILE"
    echo "I'm assuming it already exists because your \$GOROOT is already set in your env"
else
    echo "Creating GOROOT"
    mkdir -p "$GOROOT"
    chmod 777 "$GOROOT"
    echo "Updating $TERMINAL_CONFIG_FILE with require go config"
    echo "# GoLang" >> "$HOME/$TERMINAL_CONFIG_FILE"
    echo "export GOROOT=$GOROOT" >> "$HOME/$TERMINAL_CONFIG_FILE"
    echo "export PATH=$PATH:$GOROOT/bin" >> "$HOME/$TERMINAL_CONFIG_FILE"
    echo "export GOPATH=$GOPATH" >> "$HOME/$TERMINAL_CONFIG_FILE"
    echo "export PATH=$PATH:$GOPATH/bin" >> "$HOME/$TERMINAL_CONFIG_FILE"
fi

# Downloads then extracts the golang binary
wget --no-verbose https://storage.googleapis.com/golang/$GFILE -O $TMPDIR/$GFILE
if [ $? -ne 0 ]; then
    echo "Go download failed! Exiting."
    exit 1
fi

tar -C "$GOROOT" -xzf "$TMPDIR/$GFILE"

# Updates terminal with new env vars
source "$HOME/$TERMINAL_CONFIG_FILE"
echo "GOROOT set to $GOROOT"

# Creates golang specific folders if not already created
mkdir -p "$GOPATH" "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" "$GOPATH/out"
chmod 777 "$GOPATH" "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" "$GOPATH/out"
echo "GOPATH set to $GOPATH"

# Deletes the downloaded golang binary
rm -f "$TMPDIR/$GFILE"
