# Conateiner Image for OpenEmbedded / Yocto Project

FROM debian:11 AS base

# Install some extra packages and all required packages to run an OpenEmbedded build
# See 

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1 \
    zsh kas ranger sudo nano vim && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen && \
    apt clean 

FROM base AS builder

RUN useradd --groups sudo --user-group --create-home --shell /usr/bin/zsh builder && \
    echo "builder    ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/builder

USER builder

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    wget https://raw.githubusercontent.com/moarram/headline/main/headline.zsh-theme -O /home/builder/.oh-my-zsh/custom/themes/headline.zsh-theme && \
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="headline"/g' /home/builder/.zshrc && \
    mkdir /home/builder/workspace


WORKDIR /home/builder/workspace
CMD /bin/zsh

LABEL version="0.3"
LABEL description="A container image which containes all packages to build an image with OpenEmbedded / Yocto Project."
LABEL homepage="https://github.com/ManuW/oe-yp-container-image"
