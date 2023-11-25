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

**FIXME: FILL-ME-OUT**

```shell
docker run -it --rm --volume oe-workspace:/home/builder/workspace man0wee/oe-builder
git clone https://github.com/yoctoproject/poky.git
git checkout -t origin/nanbield -b my-nanbield
git pull
cd poky
source oe-init-build-env
bitbake core-image-minimal
runqemu --nographic
```

Source [Use Git to Clone Poky](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#use-git-to-clone-poky)

Source [Build Your Image](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#building-your-image)

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

Source [Docker Multi-Platform Build](https://docs.docker.com/build/building/multi-platform/)
