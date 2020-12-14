# mov-to-gif

A learning exercise to create a Docker container that converts the `.mov` files in a target directory in a volume into `.gif` files.

```
docker build --tag mov-to-gif:latest .
docker run --name mov-to-gif --volume "$(pwd)"/data:/data  mov-to-gif:latest
```