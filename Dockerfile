FROM python:3.8-slim-buster

RUN apt-get update
RUN apt-get install -y wget ffmpeg libsm6 libxext6

#Download models as first, when Dockerfile is under development and models don't need to be downloaded every change.
RUN mkdir -p /opt/car/yolo-coco
WORKDIR /opt/car/yolo-coco
RUN wget https://pjreddie.com/media/files/yolov3.weights

RUN pip install --upgrade pip
RUN pip install tensorflow
RUN pip install opencv-python
RUN pip install Pillow

COPY . /opt/car
WORKDIR /opt/car

CMD python car_color_classifier_yolo3.py -i cars.jpg