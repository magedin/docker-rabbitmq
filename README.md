<h1 align="center">Dockerized RabbitMQ by MagedIn Technology</h1>

<div align="center">
  <h4>MagedIn's docker for running a RabbitMQ installation.</h4>
  <a href="https://nginx.org" target="_blank">
    <img src="https://img.shields.io/badge/rabbitmq-3.8-orange?style=for-the-badge&logo=rabbitmq"/>
  </a>
  <a href="https://hub.docker.com/r/magedin/rabbitmq" target="_blank">
    <img src="https://img.shields.io/docker/pulls/magedin/rabbitmq?color=orange&style=for-the-badge"/>
  </a>
  <a href="https://hub.docker.com/r/magedin/rabbitmq" target="_blank">
    <img src="https://img.shields.io/docker/cloud/build/magedin/rabbitmq?color=orange&style=for-the-badge"/>
  </a>
</div>

This docker image can be used to compose a Magento 2 application. It's currently used by [Magento DockerLab](https://github.com/magedin/magento-dockerlab) project.

## How to use this image

Right below you can find some instructions to help you to use this image in your local development.

### Pulling the image

```bash
docker pull magedin/rabbitmq
```

### Configuration in Docker Compose

```yaml
version: "3"

services:
  rabbitmq:
    image: magedin/rabbitmq:3.8-management
    ports:
      - "15672:15672"
      - "5672:5672"
    volumes:
      - rabbitmqdata:/var/lib/rabbitmq
      - rabbitmqlog:/var/log/rabbitmq
    hostname: rabbitmq
```

Note that the `hostname` is intended to persist the data into a volume of the container, in the case above, `rabbitmqdata`. If you don't need to persist the data it's just to remove the line.

MagedIn Team.
