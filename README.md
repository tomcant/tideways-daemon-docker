# Dockerising the Tideways Daemon

This repo provides an Alpine Linux based Docker image for running the [Tideways](https://tideways.com) daemon. This is useful in serverless environments where you don't maintain the host machines running your applications and therefore can't simply install the `tideways-daemon` package. Services such as AWS ECS and Fargate can be used to run the _Dockerised_ daemon.

Images are [published on Docker Hub](https://hub.docker.com/r/tomcant/tideways-daemon/tags).
