# docker

[ ec2-user@ip-172-31-36-19 ~ ]$docker pull nginx   **pull the software from the origin where it was located.**

[ ec2-user@ip-172-31-36-19 ~ ]$ docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

[ ec2-user@ip-172-31-36-19 ~ ]$ docker create nginx:latest     >>>>  ** create container **
54254a34f2159f98f8046e623842d7438e8ac468e71b27cef5880ee3de1f806c

[ ec2-user@ip-172-31-36-19 ~ ]$  docker ps -a  **>>>> now we can see the container ID**
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS    PORTS     NAMES
54254a34f215   nginx:latest   "/docker-entrypoint.…"   3 seconds ago   Created             angry_cannon

[ ec2-user@ip-172-31-36-19 ~ ]$ docker start 54254a34f215 **>>>> start with container ID.**
54254a34f215

[ ec2-user@ip-172-31-36-19 ~ ]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS     NAMES
54254a34f215   nginx:latest   "/docker-entrypoint.…"   44 minutes ago   Up 10 seconds   80/tcp    angry_cannon

[ ec2-user@ip-172-31-36-19 ~ ]$ docker rm 54254a34f215 **>>> not possible to remove running container.**
Error response from daemon: cannot remove container "/angry_cannon": container is running: stop the container before removing or force remove

[ ec2-user@ip-172-31-36-19 ~ ]$ docker rm -f 54254a34f215 **>>>> removed the docker container forecely with -f**
54254a34f215

[ ec2-user@ip-172-31-36-19 ~ ]$ docker ps -a   >>>> no container 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

[ ec2-user@ip-172-31-36-19 ~ ]$ docker images ** >>>> list of images display**
REPOSITORY   TAG                    IMAGE ID       CREATED       SIZE
alpine       latest                 aded1e1a5b37   2 weeks ago   7.83MB
nginx        latest                 b52e0b094bc0   3 weeks ago   192MB
nginx        mainline-alpine-perl   c0d716c84e7f   3 weeks ago   86.2MB

[ ec2-user@ip-172-31-36-19 ~ ]$ docker rmi nginx:latest **>>>> remove the image**
Untagged: nginx:latest
Untagged: nginx@sha256:9d6b58feebd2dbd3c56ab5853333d627cc6e281011cfd6050fa4bcf2072c9496s
Deleted: sha256:b52e0b094bc0e26c9eddc9e4ab7a64ce0033c3360d8b7ad4ff4132c4e03e8f7b
Deleted: sha256:3c8b88c16794e3082397557e5482f5a04a6c295cec37919c65c234e1a3645e80
Deleted: sha256:d5c83383666c732fcb30d7e25c74c2e0884c262f2e497cc9f2844870980311d8
Deleted: sha256:d62b6301e685a7cdc3bb3b1508a959e4710a707ea2f680f848c19a9ad74ac6a7
Deleted: sha256:d443654bda4a04f31ba6bd39bed82a053a17f2974b401fef552e4e88d6546db8
Deleted: sha256:129409d5d363e5d5af273f0b2a90237f708ed9972f8d58a4dbcd17f1abbabe21
Deleted: sha256:a3a2912e392a24d8c7dde076a3778c6eded8839660963ac2084e051eb6931c13
Deleted: sha256:5f1ee22ffb5e68686db3dcb6584eb1c73b5570615b0f14fabb070b96117e351d

[ ec2-user@ip-172-31-36-19 ~ ]$ docker images **>> now no latest nginx image**
REPOSITORY   TAG                    IMAGE ID       CREATED       SIZE
alpine       latest                 aded1e1a5b37   2 weeks ago   7.83MB
nginx        mainline-alpine-perl   c0d716c84e7f   3 weeks ago   86.2MB

[ ec2-user@ip-172-31-36-19 ~ ]$ docker images -a -q  **>>> list of images**
aded1e1a5b37
c0d716c84e7f

[ ec2-user@ip-172-31-36-19 ~ ]$ docker rmi `docker images -a -q`  **>>> remove all images**
Untagged: alpine:latest
Untagged: alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c
Deleted: sha256:aded1e1a5b3705116fa0a92ba074a5e0b0031647d9c315983ccba2ee5428ec8b
Untagged: nginx:mainline-alpine-perl
Untagged: nginx@sha256:b948629705bb94a3947846babda0a222577b1eadcc3e551bfafef47c7581666b
Deleted: sha256:c0d716c84e7f67a29e884b31b620f186cf71c8d918503cf51871e96d9a3aede2
Deleted: sha256:31be18edb6bb34f21aad63e09fb4a498cdff15d5e4519f41e892577cbac38d95
Deleted: sha256:85709b1869812616189f9b3347689a2b63817c0c319dfdd725465413ad70623d
Deleted: sha256:ee406d9dd9157f2d93cc60a5439054de89e11af5685bc6672f7c929cd9fe5a90
Deleted: sha256:bce08bd50eaa0b9c02d46240fd82c4ad6882b3bf5520be0dd681817bc085bc88
Deleted: sha256:f78f7efda4aaff92ba06ba89433f71b12d043975aa1b4d51c6aaa37048346713
Deleted: sha256:92c3896abdd8c4a2f9bec09d462c9186bef2341ba004a51e3ef328346c0cbe53
Deleted: sha256:055c9cb94079eafd5f7c3ce0ffdd84f7aa6ae6db16eb7c11999720b80cd58360
Deleted: sha256:5f9ae7b1f5994f699cebbcca01fdfaf0836c2beef0bf5390aff17744d642ee15
Deleted: sha256:08000c18d16dadf9553d747a58cf44023423a9ab010aab96cf263d2216b8b350

[ ec2-user@ip-172-31-36-19 ~ ]$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE


[ ec2-user@ip-172-31-36-19 ~ ]$ docker run nginx  **>>> pull+create+start **

[ ec2-user@ip-172-31-36-19 ~ ]$docker run -d nginx
85370699526b02d972ae55f25c40de18ff44e7c564cc24d1c18a0f2274eb4203

[ ec2-user@ip-172-31-36-19 ~ ]$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
85370699526b   nginx     "/docker-entrypoint.…"   48 seconds ago   Up 47 seconds   80/tcp    beautiful_babbage

[ ec2-user@ip-172-31-36-19 ~ ]$ docker run -d -p 80:80 nginx **>>  port mapping**
6a80999eece5e54bc553eed7aa2451dfdc794cb66a296cf261023ebf4118ae3c

[ ec2-user@ip-172-31-36-19 ~ ]$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                 NAMES
6a80999eece5   nginx     "/docker-entrypoint.…"   5 minutes ago    Up 5 minutes    0.0.0.0:80->80/tcp, [::]:80->80/tcp   hungry_jennings
85370699526b   nginx     "/docker-entrypoint.…"   12 minutes ago   Up 12 minutes   80/tcp                                beautiful_babbage


[ ec2-user@ip-172-31-36-19 ~ ]$ docker exec -it 6a80999eece5 bash
root@6a80999eece5:/#
root@6a80999eece5:/# cd /usr/share/nginx/html/
root@6a80999eece5:/usr/share/nginx/html# ls -l
total 8
-rw-r--r-- 1 root root 497 Feb  5 11:06 50x.html
-rw-r--r-- 1 root root 615 Feb  5 11:06 index.html
root@6a80999eece5:/usr/share/nginx/html# vim index.html
bash: vim: command not found
root@6a80999eece5:/usr/share/nginx/html# cat index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@6a80999eece5:/usr/share/nginx/html#

root@6a80999eece5:/usr/share/nginx/html# echo 'hi am from container'
hi am from container
root@6a80999eece5:/usr/share/nginx/html# echo 'hi am from container' > index.html
root@6a80999eece5:/usr/share/nginx/html#


[ ec2-user@ip-172-31-36-19 ~ ]$ docker logs 6a80999eece5 **>>> to check logs in container**

[ ec2-user@ip-172-31-36-19 ~ ]$ docker inspect 6a80999eece5
[
    {
        "Id": "6a80999eece5e54bc553eed7aa2451dfdc794cb66a296cf261023ebf4118ae3c",
        "Created": "2025-03-05T06:38:50.581488619Z",
        "Path": "/docker-entrypoint.sh",}]
