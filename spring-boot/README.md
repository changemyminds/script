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
```sh
chmod +x update-docker-image.sh
./update-docker-image.sh YOUR_IMAGE_NAME
```

### Start Docker container
`SPRING_PROFILES_ACTIVE` is `Spring.Profiles.Active` you can change to your env
```sh
docker run -d -it --name=my-container-name \
    -p 8080:8080 -e "SPRING_PROFILES_ACTIVE=prod" \
    YOUR_IMAGE_NAME
```