python train.py --batch 8 \
        --cfg cfg/training/yolov7.yaml \
        --epochs 300 \
        --data ./data/custom.yaml \
        --weights yolov7.pt \
        --name best\
        --hyp data/hyp.scratch.p5.yaml \
        --device 0 \
        --img-size 768\
