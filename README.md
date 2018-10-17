# Install golang on Ubuntu for Windows!

This is a script I use to install and update my golang version on Ubuntu for Windows. Originally found much of the script in a blog but needed to change a bit to make it work on my version.

This downloads the linux distribution of golang and installs it on your Ubuntu for windows filesystem. It also updates your path and your terminal config file for the appropriate golang things.

## Instructions
You shoud review the variables at the top of the script before running. They are set to where I want things, but you will likely want to update them to your preference.
- clone this repo
- make sure the script is executable 
```bash
chomod + x ./installgo.sh
```
- update the variables
- - GVERSION is the version of go you wish to install
- - GOPATH: set to where you want yoru gopath, should be something like `$HOME/go`
- - GOROOT: should be something like `$HOME/go/goroot/`
- - TEMP_GO_DOWNLOAD: this is a folder in your `$TMPDIR` that the binary downloads to
- - TERMINAL_CONFIG_FILE: set to `.bashrc` change if required
- Execute the script. depending on yoru user permissions, you may need to use sudo.
```bash
sudo ./installgo.sh
```

- verify installation is sucessful by typing 
```bash
go version
```