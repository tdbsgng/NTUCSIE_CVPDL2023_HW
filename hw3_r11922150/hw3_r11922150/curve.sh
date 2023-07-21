python detect.py \
    --weights runs/train/udamap50/weights/init.pt \
    --img-size 2048 \
    --source ./yolo_data/$1/images/ \
    --name init \
    --conf-thres 0.0001\
    --augment \
    --iou-thres 0.7 \


python yolo2json.py ./runs/detect/init/labels/ ./init.json $1/

python ./check_your_prediction_valid.py ./init.json ../hw3_dataset/$1.coco.json 

rm -r ./runs/detect/init
rm ./init.json
for number in {5..95..5}
do
    python detect.py \
    --weights runs/train/udamap50/weights/epoch$number.pt \
    --img-size 2048 \
    --source ./yolo_data/$1/images/ \
    --name $number \
    --conf-thres 0.0001\
    --augment \
    --iou-thres 0.7 \


    python yolo2json.py ./runs/detect/$number/labels/ ./$number.json $1/

    python ./check_your_prediction_valid.py ./$number.json ../hw3_dataset/$1.coco.json 

    rm -r ./runs/detect/$number
    rm ./$number.json
done
python detect.py \
    --weights runs/train/udamap50/weights/last.pt \
    --img-size 2048 \
    --source ./yolo_data/$1/images/ \
    --name last\
    --conf-thres 0.0001 \
    --augment \
    --iou-thres 0.7 \


python yolo2json.py ./runs/detect/last/labels/ ./last.json $1/

python ./check_your_prediction_valid.py ./last.json ../hw3_dataset/$1.coco.json 

rm -r ./runs/detect/last
rm ./last.json
python curve.py