FROM dock0/arch

# make user account
RUN pacman -Syu --noconfirm sudo ;\
  mkdir /home/user ;\
  useradd -d /home/user user ;\
  echo "user:password" | chpasswd ;\
  echo "user ALL=(ALL) ALL" >> /etc/sudoers ;\
  chmod a+rwx /home/user ;\
  mkdir -m 0755 /nix && chown user /nix ;

# install nix
USER user
ENV USER user
WORKDIR /home/user
RUN curl http://nixos.org/nix/install | bash 

CMD bash --init-file /home/user/.nix-profile/etc/profile.d/nix.sh ;
