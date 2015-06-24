altitude=/home/user/altitude/
altitudeFiles=/home/user/altitude-files/

echo "stage 1: building mod"
echo ">>pulling repository"
rm -rf ./altitude-mods/
git clone https://github.com/MagneticDuck/altitude-mods/

echo ">>building mod..."
nix-build ./altitude-mods/ -A $1

echo "stage 2: setting up for launch"
echo ">>killing server..."
pkill java

echo ">>killing mod process..."
pkill run

echo ">>loading server files..."
rm -rf $altitudeFiles/servers/
if [ -d result/servers ];
then 
  mkdir -p $altitudeFiles/servers/
  cp result/servers/* $altitudeFiles/servers/
else 
  echo "  (no servers directory in mod, doing nothing)"
fi

echo "stage 3: launching"
echo ">>launching server...";
nohup /home/user/altitude-files/server_launcher &> $altitude/server-log &

echo ">>waiting for server to start...";
while [ ! -f $altitudeFiles/servers/command.txt -o ! -f $altitudeFiles/servers/log.txt ];
do true; done
sleep 1

echo ">>making symlinks...";
mkdir -p $altitude/servers/
for i in command.txt log.txt ;
  do 
    rm -f $altitude/servers/$i
    ln -s $altitudeFiles/servers/$i $altitude/servers/$i; done

echo ">>launching mod service...";
if [ -x result/run ]; 
then nohup result/run &
else echo "  (no binary detected, doing nothing)" ; fi

exit 0
