wget https://www.dropbox.com/s/wnlnqhxl3fh4naf/0.zip?dl=1 -O ./0.zip
wget https://www.dropbox.com/s/npldd2fqsm9bz8e/33.zip?dl=1 -O ./33.zip
wget https://www.dropbox.com/s/8a9gp5mr8x22h9l/66.zip?dl=1 -O ./66.zip
wget https://www.dropbox.com/s/hi3wspx5bq2dq59/100.zip?dl=1 -O ./100.zip
unzip ./0.zip 
unzip ./33.zip 
unzip ./66.zip 
unzip ./100.zip 
mv runs/train/udamap50/weights/init.pt ./0.pt
mv runs/train/udamap50/weights/epoch33.pt ./1.pt
mv runs/train/udamap50/weights/epoch66.pt ./2.pt
mv runs/train/udamap50/weights/last.pt  ./3.pt
cp ./3.pt  ./4.pt