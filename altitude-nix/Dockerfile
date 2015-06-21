FROM magneticduck/arch-nix

# install dependencies, download installer
USER root
RUN curl http://installer.altitudegame.com/0.0.1/altitude.sh \
    > altitude.sh ;\
  chmod a+rwx ./altitude.sh 

# set normal user
USER user
ENV USER user

# install altitude now
RUN yes '' | ./altitude.sh 

# modify structure, add helper script
RUN mv /home/user/altitude /home/user/altitude-files ;\
  mkdir -p /home/user/altitude
ADD ./run.sh /home/user/altitude/run.sh

WORKDIR /home/user/altitude
