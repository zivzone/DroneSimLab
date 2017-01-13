#!/bin/bash
xhost + local:

#ARDU_PATH=`cd ../../ardupilot && pwd`
#echo $ARDU_PATH
#docker run -it --rm --name sitl_run -v $ARDU_PATH:/ardupilot -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sitl_image /bin/bash
docker run -it --rm --name sitl_run_px4$2 \
-v $1:/PX4  \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-e USERNAME=docker \
-e USER=docker \
-v /local/dockerhome:/home/docker \
-e HOME=/home/docker \
-u $UID \
--privileged \
--net host \
sitl_image_px4 "/bin/bash"

#make posix_sitl_default jmavsim
