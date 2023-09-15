#Language exports


#ZIG
export PATH=$PATH:/usr/local/zig



#golang
# Create the Golang directory if it doesn't exist
mkdir -p ~/Golang/bin

#GOLANG
#            #export GOROOT=/usr/local/go/bin
#module
export GO111MODULE='on'
# local go workspace
export GOPATH="${HOME}/Golang"

#go installs
export GOBIN="${HOME}/Golang/bin"
export PATH="$PATH:${GOBIN}"

#golang runtime //goroot
export PATH=$PATH:/usr/local/go/bin

#Mojo
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
