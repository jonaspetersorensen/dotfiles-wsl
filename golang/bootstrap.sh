#!/bin/bash

# This script will install
# - golang
echo ""
echo "Starting install of golang tooling"
echo ""

function bootstrap_golang()
{
	local packageName
	local binPath

	packageName="go1.11.linux-amd64.tar.gz"
	binPath="/usr/local/go/bin"
	
	# Download, clean up and move source to default location
	sudo curl -O https://storage.googleapis.com/golang/"$packageName"
	sudo tar -xvf "$packageName"
	rm -f "$packageName"
	
	# Clean out previous version before adding new version
	if [ -d "/usr/local/go" ]; then  		
		sudo rm -rf /usr/local/go
	fi
	sudo mv go /usr/local

	# Add to path
	case ":$PATH:" in
  		*:"$binPath":*)
			echo it is in the path
			;;

  		*)
			echo "Adding Go bin to PATH"

			#echo "# Golang" >> ~/.profile
			#echo "export PATH=\$PATH:$binPath" >> ~/.profile

			echo "# Golang" >> ~/.zshrc
			echo "export PATH=\$PATH:$binPath" >> ~/.zshrc
			;;
	esac

}

bootstrap_golang

echo ""
echo "Install of golang tooling done."