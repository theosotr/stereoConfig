#!/bin/sh

sudo apt-get update >/home/tushar/stereoConfig/StereoUpdate/aptgetUpdateLog.txt 2>/home/tushar/stereoConfig/StereoUpdate/err.txt
sudo apt-get upgrade >>/home/tushar/stereoConfig/StereoUpdate/aptgetUpdateLog.txt 2>>/home/tushar/stereoConfig/StereoUpdate/err.txt
