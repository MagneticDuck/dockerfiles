FROM magneticduck/arch-nix

# install dependencies, download installer
USER root
RUN pacman -S --noconfirm jre7-openjdk ;\
  curl http://installer.altitudegame.com/0.0.1/altitude.sh > altitude.sh ;\
  chmod a+rwx ./altitude.sh ;\
  mkdir -p /usr/lib/jre/bin ; cp /usr/bin/java /usr/lib/jre/bin/ ;

# set normal user
USER user
ENV USER user

# install altitude now.. doesn't seem to work
