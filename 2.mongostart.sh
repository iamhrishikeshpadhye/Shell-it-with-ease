
cd /home/dbsl/mongodb-linux-x86_64-2.6.3/bin/		#Change the path to the directory where your bin files of MongoDB are located.
echo "Enter the address of your MongoDB server : "
read address		#Enter the address of your MongoDB Server
echo "Enter your database name : "
read dbname
echo "Enter your username : "
read uname
./mongo $address/$dbname -u te1148 -p #
