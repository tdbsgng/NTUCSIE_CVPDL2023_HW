python train.py \
 --name src\
 --batch 2 \
 --img 2048 \
 --epochs 100 \
 --data data/custom.yaml \
 --weights $1 \
 --save-period 5 \
 --hyp ./data/hyps/hyp.scratch-med.yaml

 python uda_train.py \
 --name uda\
 --batch 2 \
 --img 2048 \
 --epochs 100 \
 --data data/custom_uda.yaml \
 --weights runs/train/src/weights/best.pt\
 --save-period 1 \
 --device 0 \
