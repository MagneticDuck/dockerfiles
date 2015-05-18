FROM magneticduck/arch-nix

# copy files
COPY rns_3_0_1_linux_x86_64.tar.gz /hone/user/rns.tar.gz
COPY install-patch.diff /home/user/install-patch.diff

# install dependencies
USER root
RUN pacman -S --noconfirm libx11 gcc-libs alsa-lib 

# prepare installer
USER user
ENV USER user
WORKDIR /home/user

CMD whoami
# RUN tar -xf rns.tar.gz ;\
  # cd rns_3_0_1_linux_x86_64 ;\
  # patch install.sh ../install-patch.diff

#WORKDIR /home/user
