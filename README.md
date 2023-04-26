# ex280 model exam and  exam simulation

This repository contains a set of exam questions and a simulation environment for the EX280 certification exam. These materials are intended to help you prepare for the exam by simulating the exam environment and testing your knowledge of the topics covered in the exam.

Contents:

exam-questions/ - ex280_v410_model exam/Questions.txt directory contains a set of exam questions in text format. These questions are similar in style and difficulty to those you will encounter on the actual EX280 exam.

exam-simulation/ - ex280/model_exam_simulator.sh File simulate environment that replicates the exam environment as closely as possible. 

## To run the exam-simulator:
```shell
git clone https://github.com/ramanathanmurugappan/ex280
```
### get inside ex280 directory
```shell
cd ex280
```
### give permission to exam-simulator file
```shell
chmod 775 model_exam_simulator.sh
```
### run exam-simulator file
```shell
./model_exam_simulator.sh
```
## Wait for 25-30min for script to setup your exam scenario

### verify proper exam has been created
```shell
oc get projects | grep -e bullwinkle -e gru -e lerna -e area51 -e math -e apples -e pathfinder -e mercury
```
if 8 project is listed you are good to go

## ALL THE BEST 

I have passed the exam on April 10 2023

