FROM magneticduck/arch-nix

RUN source ~/.nix-profile/etc/profile.d/nix.sh ;\
  git clone https://github.com/WH-Admins/whclan-bot ;\
  cd whclan-bot ;\
  nix-build

EXPOSE 6667
