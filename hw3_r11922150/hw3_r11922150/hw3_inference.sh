python get_folders.py $1
count=0
mkdir ./tmpjson
while IFS= read -r line
do
    python detect.py \
        --weights ./$3.pt \
        --img-size 2048 \
        --source $1$line \
        --name tmp \
        --conf-thres 0.0001\
        --augment \
        --iou-thres 0.5 \

    python yolo2json.py ./runs/detect/tmp/labels/ ./tmpjson/$count.json $line/
    ((count += 1))

    rm -r ./runs/detect/tmp/
done < ./tmp.txt

rm ./tmp.txt

python summarize.py $2 
rm -r ./tmpjson