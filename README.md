# Conateiner Image for OpenEmbedded / Yocto Project

git address https://github.com/ManuW/oe-yp-container-image.git

A container image which containes all packages to build an image with OpenEmbedded / Yocto Project.

## Image

Some details about the container image

- Debian based image

- User builder

    - Can run sudo w/o password (sudo -i)

        In case you want to install packages afterwards

    - oh-my-zsh with headline theme

        https://ohmyz.sh

        https://github.com/Moarram/headline

- Packages
    
    - ranger
    
        Console file manager

        https://github.com/ranger/ranger

    - kas

        Setup tool for bitbake based projects

        [kas project site](https://github.com/siemens/kas)

    - Editor

        [nano](https://www.nano-editor.org) [vim](https://www.vim.org)

    - All required packages
        
        [Required Packages for the Build Host](https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host)

## OpenEmbedded / Yocto Project Example Usage

```shell
# Run container
# - Remove after exit container
# - Mount volume oe-workspace
docker run -it --rm --volume oe-workspace:/home/builder/workspace man0wee/oe-builder

# Clone poky (Github mirror)
git clone https://github.com/yoctoproject/poky.git
cd poky

# Checkout latest OpenEmbedded version
git checkout -t origin/nanbield -b my-nanbield
git pull

# Source and build a minimal image
source oe-init-build-env
bitbake core-image-minimal

# Start QEMU without graphic and use user network
runqemu nographic slirp
```

Link [Use Git to Clone Poky](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#use-git-to-clone-poky)

Link [Build Your Image](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#building-your-image)

[runqemu Command Line Info](https://docs.yoctoproject.org/dev-manual/qemu.html#qemu-command-line-syntax)

## Local Build and Run the Container Image

```shell
docker build -t oe-builder .
docker run -it -rm oe-builder
```

## Build and Publish for Multiple Platforms

```shell
docker buildx create --name mybuilder --bootstrap --use
docker buildx build --platform linux/amd64,linux/arm64 -t man0wee/oe-builder:latest --push .
```

Link [Docker Multi-Platform Build](https://docs.docker.com/build/building/multi-platform/)
