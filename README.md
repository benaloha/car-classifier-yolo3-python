# Car classification example with YOLOv3 object detector

## Combination of this two repos
-[Car color classification example with YOLOv3 object detector](https://github.com/spectrico/car-color-classifier-yolo3-python.git)  
-[Car make, model classification example with YOLOv3 object detector](https://github.com/spectrico/car-make-model-classifier-yolo3-python.git)  

## Use
`
docker build -t car .
`  
`
docker run -it --rm -v /home/ben/projects/car-classifier-yolo3-python/data/:/opt/car/data -e IMG='filenameInDataMap.jpg' car
`

## Raspberry Ubuntu focal 64 bits
Gebruik tensorflow build from [repo](https://github.com/benaloha/build)  
Copy dit whl naar deze repo-root en build de docker image.  
Misschien kan het inmiddels ook gewoon met pip install tensorflow..  

# Original README

# Car color classification example with YOLOv3 object detector

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](LICENSE)

## Introduction

A Python example for using [Spectrico's car color classifier](http://spectrico.com/car-color-recognition.html). It consists of an object detector for finding the cars, and a classifier to recognize the colors of the detected cars. The object detector is an implementation of YOLOv3 (OpenCV DNN backend). It doesn't use GPU and one frame takes 1s to process on Intel Core i5-7600 CPU. YOLOv3 weights were downloaded from [YOLO website](https://pjreddie.com/darknet/yolo/). The classifier is based on MobileNet (TensorFlow backend). It takes 35 milliseconds on Intel Core i5-7600 CPU for single classification. It can be accelerated more by running on GPU and using batching.

---
## Object Detection and Classification in images
This example takes an image as input, detects the cars using YOLOv3 object detector, crops the car images, makes them square while keeping the aspect ratio, resizes them to the input size of the classifier, and recognizes the color of each car. The result is shown on the display and saved as output.jpg image file.


#### Usage
Use --help to see usage of car_color_classifier_yolo3.py:
```
$ python car_color_classifier_yolo3.py --image cars.jpg
```
```
$ python car_color_classifier_yolo3.py [-h] [--yolo MODEL_PATH] [--confidence CONFIDENCE] [--threshold THRESHOLD] [--image]

required arguments:
  -i, --image              path to input image

optional arguments:
  -h, --help               show this help message and exit
  -y, --yolo MODEL_PATH    path to YOLO model weight file, default yolo-coco
  --confidence CONFIDENCE  minimum probability to filter weak detections, default 0.5
  --threshold THRESHOLD    threshold when applying non-maxima suppression, default 0.3
```
![image](https://github.com/spectrico/car-color-classifier-yolo3-python/blob/master/output-classic-car-574864_960_720.jpg?raw=true)

---
## Requirements
  - python
  - numpy
  - tensorflow
  - opencv
  - yolov3.weights must be downloaded from [https://pjreddie.com/media/files/yolov3.weights](https://pjreddie.com/media/files/yolov3.weights) and saved in folder yolo-coco

---
## Configuration

The settings are stored in python file named config.py:
```
model_file = "model-weights-spectrico-car-colors-mobilenet-224x224-052EAC82.pb"
label_file = "labels.txt"
input_layer = "input_1"
output_layer = "softmax/Softmax"
classifier_input_size = (224, 224)
```
***model_file*** is the path to the car color classifier
***classifier_input_size*** is the input size of the classifier
***label_file*** is the path to the text file, containing a list with the supported colors

---
## Credits
The examples are based on the tutorial by Adrian Rosebrock: [YOLO object detection with OpenCV](https://www.pyimagesearch.com/2018/11/12/yolo-object-detection-with-opencv/)

The YOLOv3 object detector is from: [YOLO: Real-Time Object Detection](https://pjreddie.com/darknet/yolo/)

```
@article{yolov3,
  title={YOLOv3: An Incremental Improvement},
  author={Redmon, Joseph and Farhadi, Ali},
  journal = {arXiv},
  year={2018}
}
```

The car color classifier is based on MobileNet neural network architecture: [MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications](https://arxiv.org/abs/1704.04861)
```
@article{howard2017mobilenets,
  title={Mobilenets: Efficient convolutional neural networks for mobile vision applications},
  author={Howard, Andrew G and Zhu, Menglong and Chen, Bo and Kalenichenko, Dmitry and Wang, Weijun and Weyand, Tobias and Andreetto, Marco and Adam, Hartwig},
  journal={arXiv preprint arXiv:1704.04861},
  year={2017}
}
```
