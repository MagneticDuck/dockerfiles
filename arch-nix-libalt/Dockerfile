FROM magneticduck/arch-nix

RUN git clone --recursive http://gitlab.com/xalri/libalt ;\
  cd libalt ;\
  source ~/.nix-profile/etc/profile.d/nix.sh ;\
  nix-shell . --run true ;\
  cd .. ; rm -rf libalt ;

