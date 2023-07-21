python uda_train.py \
 --name udamap50\
 --batch 2 \
 --img 2048 \
 --epochs 100 \
 --data data/custom_uda.yaml \
 --weights runs/train/map50/weights/best.pt\
 --save-period 1 \
 --device 0 \
