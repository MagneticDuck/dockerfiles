FROM dock0/arch

# install basic utilities, prep system
ADD ./pacman.conf /etc/pacman.conf
RUN pacman -Syu --noconfirm git patch sudo ;\
  pacman -Rdd --noconfirm gcc-libs ;\
  pacman -S --noconfirm gcc-libs-multilib

# make user account
RUN mkdir -p /home/user ;\
  useradd -d /home/user user ;\
  echo "user:password" | chpasswd ;\
  echo "root:password" | chpasswd ;\
  echo "user ALL=(ALL) ALL" >> /etc/sudoers ;\
  chmod a+rwx /home/user ;\
  mkdir -m 0755 /nix && chown user /nix ;

# set standard shell state
USER user
ENV USER user
WORKDIR /home/user

# install nix
RUN curl http://nixos.org/nix/install | bash ;\
  source ~/.nix-profile/etc/profile.d/nix.sh 
RUN echo "source /home/user/.nix-profile/etc/profile.d/nix.sh" > .profile

CMD bash --init-file /home/user/.profile
