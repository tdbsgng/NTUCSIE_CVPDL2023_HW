python ./yolov7/detect.py \
    --weights ./best.pt \
    --img-size 768 \
    --source $1 \
    --name default \
    --conf-thres 0 \
    --augment \
    --iou-thres 0.7 \
    --project ./detect \
    --name test
python ./yolov7/yolo2json.py ./detect/test/labels/ $2

rm -r ./detect