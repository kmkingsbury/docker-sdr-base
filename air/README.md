xhost +
docker run --rm -i -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix -v /dev/usb:/dev/usb -p 8085:8080 -p 8086:8081 --privileged --name air air mono VirtualRadar.exe 

docker exec -it <CID> /bin/bash
./dump1090 --interactive --net --net-beast --net-ro-port 31001 --net-http-port 8081


Open Web Broswer:
localhost:8085/VirtualRadar/

