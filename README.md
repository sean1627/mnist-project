# Mnist-Project

This project aims to deploy a Mnist Project on the Docker container and store the predict result into the Cassandra database.

While the user submits a Curl command to the designated address, the Flask Router first makes 
a safety check to both the command and the image file it contains. The Router 
then saves the image and requests the prediction from the MNIST TensorFlow model. 
After the result returns, the Router forwards the result to the user and submits all four data 
to the Cassandra Database Container through the Docker Network Bridge.

Finally, the Cassandra Database records the user IP address, the service request time, 
the predicted result, and the path to the uploaded image.

## Tutorials and Reference
1.MNIST

[1] https://www.tensorflow.org/versions/r1.4/get_started/mnist/beginners

[2] https://github.com/tensorflow/tensorflow/blob/r1.4/tensorflow/examples/tutorials/mnist/mnist_softmax.py

[3] https://github.com/tensorflow/tensorflow/blob/r1.4/tensorflow/examples/tutorials/mnist/mnist_deep.py

[4] https://blog.csdn.net/huaweizte123/article/details/79672479

2.FLASK http://flask.pocoo.org/docs/0.12/quickstart/#a-minimal-application

3.Docker https://docs.docker.com/get-started/

According to https://docs.docker.com/docker-for-mac/, install Docker for Mac

How to write Dockerfile. https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

Configure networking https://docs.docker.com/network/

4.Cassandra: 

[1] https://hub.docker.com/_/cassandra/ 

[2] http://abiasforaction.net/a-practical-introduction-to-cassandra-query-language/ 

[3] https://mannekentech.com/2017/01/02/playing-with-a-cassandra-cluster-via-docker/

## Running
1. Creating and Running Cassandra Image

` docker-compose up -d` to run cassandra image

2. Application Container Preparation

First run

` docker build --tag=digit:latest .`

This command will build an application image from Dockerfile. 
And for this example, the image is named as "digit:latest"

Then run

` docker run -p 8000:8000 --network=mnist-project-master_mnist --ip 156.167.0.15 digit:latest`

This command will run the container upon the image you created above on Port 8000.

3. Submit Pictures to Predict

The default URL to the service is "http://0.0.0.0:8000". 

Go to this website, you can submit digit pictures. And then the website will show the results.

4. Record the Result in Cassandra Database

In terminal, run this command

`docker exec -it cassandratable cqlsh`

Then use cqlsh command,

`select * from keyspacetest.mytable ;`




