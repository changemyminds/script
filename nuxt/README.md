### Build Dokcer image
```sh
# 'VERSION' is you app version, you can use git tag or something
VERSION=1.0.0
docker build -t YOUR_IMAGE_NAME --build-arg VERSION=${VERSION} .
# push your image to your docker harbor
docker push YOUR_IMAGE_NAME
# remove the local image
docker rmi YOUR_IMAGE_NAME
```

### Update Docker image
See the [update-docker-image.sh](/script/update-docker-image.sh)
```sh
chmod +x update-docker-image.sh
./update-docker-image.sh YOUR_IMAGE_NAME
```

### Start Docker container
```sh
docker run -d -it --name=my-container-name \
    -p 3001:3000 \
    YOUR_IMAGE_NAME
```