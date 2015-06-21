echo "launching server...";
rm -rf /home/user/altitude-files/servers ;
nohup /home/user/altitude-files/server_launcher &> /dev/null &

echo "waiting for server to start...";
while [ ! -f /home/user/altitude-files/servers/command.txt -o ! -f /home/user/altitude-files/servers/log.txt ];
do true; done

sleep 1;

echo "making symlinks...";
mkdir -p /home/user/altitude/servers/
for i in /home/user/altitude-files/servers/* ; 
  do ln -s $i /home/user/altitude/servers/$(basename $i);
done

echo "launching mod service...";
if [ -x /home/user/altitude/result ]; 
then
  /home/user/altitude/result ;
else
  echo "  (no mod detected, running in vanilla mode)" ;
fi
