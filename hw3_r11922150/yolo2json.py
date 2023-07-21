import os 
import sys
import json
def yolo2json(yolo_path,output_path):
    d = {}
    for img in os.listdir(yolo_path):
        boxes = []
        labels = []
        scores = []
        with open(yolo_path+img,'r') as f:
            for line in f.readlines():
                line = line[:-1].split(" ")
                labels.append(eval(line[0])+1)
                boxes.append(list(map(eval,line[1:5])))
                scores.append(eval(line[-1]))
        img = prefix+img[:-3] + 'png'
        d[img] = {}
        d[img]["boxes"] = boxes
        d[img]["scores"] = scores
        d[img]["labels"] = labels
    with open(output_path,'w') as f:
        json.dump(d,f,indent =4)       


if __name__ == "__main__":
    yolo_path = sys.argv[1]
    output_path = sys.argv[2]
    prefix = sys.argv[3]
    yolo2json(yolo_path,output_path)

    