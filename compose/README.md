simple64 Local Multiplayer Netplay Server using Docker Compose
=====
This example defines a basic set up for a simple64 Local Multiplayer Netplay Server using Docker Compose. 

Project structure:
```
.
├── docker-compose.yml
├── simple64-netplay-server.env
└── README.md
```

[_docker-compose.yml_](docker-compose.yml)
```
services:
  simple64-netplay-server:
    image: k4rian/simple64-netplay-server:latest
    container_name: simple64-netplay-server
    volumes:
      - data:/home/simple64
      - /etc/localtime:/etc/localtime:ro
    env_file:
      - simple64-netplay-server.env
    ports:
      - "45000-45010" # TCP/UDP
    restart: unless-stopped

volumes:
  data:
```

* When deploying, Compose maps the server ports to the same ports of the host as specified in the compose file.

* The environment file *[simple64-netplay-server.env](simple64-netplay-server.env)* holds the server configuration.

## Deployment
```bash
docker compose -p simple64-netplay-server up -d
```
*__Note__*: the project is using a volume in order to store the server data that can be recovered if the container is removed and restarted.

## Expected result
Check that the container is running properly:
```bash
docker ps | grep "simple64"
```

To see the server log output:
```bash
docker compose -p simple64-netplay-server logs
```

## Stop the container
Stop and remove the container:
```bash
docker compose -p simple64-netplay-server down
```

Both the container and its volume can be removed by providing the `-v` argument:
```bash
docker compose -p simple64-netplay-server down -v
```