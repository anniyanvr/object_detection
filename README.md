# object_detection
The instructions to run the container are as follows:</br>

1.Build the image using the Dockerfile</br>
**Command:**
docker build -t object_detection_image . </br>
2.Create a container from the image </br>
**Command:**
docker create --name object_detection object_detection_image</br>
3.Start the container</br>
**Command:** 
docker start object_detection </br>
4.Check if the container has started as expected </br>
**Command:**
docker ps </br>
5.If container is not present in the list yielded from above command check the logs </br>
**Command:**
docker logs object_detection </br>
6.Alternatively skip steps 2 to 4 and execute the YAML file </br>
**Command:**
docker-compose up </br>
7.To review the content of the html file get inside the container </br>
**Command:**
docker exec -it object_detection bash </br>