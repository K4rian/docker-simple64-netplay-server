<p align="center">
 <img alt="docker-simple64-netplay-server logo" src="https://raw.githubusercontent.com/K4rian/docker-simple64-netplay-server/assets/icons/logo-docker-simple64-netplay-server.svg" width="25%" align="center">
</p>

A Docker image for the [simple64][1] local multiplayer netplay server based on the official [Alpine Linux][2] [image][3].<br>
The server allows you to play N64 games via netplay using the [simple64][1] or [Mupen64Plus][9] emulators (with [Rosalie's Mupen GUI (RMG)][10] for the latter).

---
<div align="center">

Docker Tag     | Version | Platform     | Description
---            | ---     | ---          | ---
[latest][8]    | 1.2     | amd64, arm64 | Latest release (S64NS v2024.12.1)
[2024.12.1][8] | 1.2     | amd64, arm64 | S64NS v2024.12.1

<details>
<summary>Show more</summary>

Docker Tag     | Version | Platform     | Description
---            | ---     | ---          | ---
[2024.10.1][8] | 1.2     | amd64, arm64 | S64NS v2024.10.1
[2024.06.1][8] | 1.2     | amd64, arm64 | S64NS v2024.06.1
[2024.03.1][7] | 1.1     | amd64, arm64 | S64NS v2024.03.1
[2024.01.1][7] | 1.1     | amd64, arm64 | S64NS v2024.01.1

</details>
</div>

---
<p align="center"><a href="#environment-variables">Environment variables</a> &bull; <a href="#usage">Usage</a> &bull; <a href="#using-compose">Using Compose</a> &bull; <a href="#manual-build">Manual build</a> <!-- &bull; <a href="#see-also">See also</a> --> &bull; <a href="#license">License</a></p>

---
## Environment variables
A few environment variables can be tweaked when creating a container to define the server configuration:

<details>
<summary>Click to expand</summary>

Variable                | Default value                | Description 
---                     | ---                          | ---
S64NS_NAME              | simple64 Netplay Server      | Server name.
S64NS_PORT              | 45000                        | Port<sup>1</sup> to listen on (TCP/UDP).
S64NS_LOGPATH           | simple64-netplay-server.log  | File path to store the logs.
S64NS_MOTD              |                              | Message of the day to display to clients.
S64NS_MAXGAMES          | 10                           | Maximum number of concurrent games.
S64NS_DISABLEBROADCAST  | false                        | Disables LAN broadcast.
S64NS_ENABLEAUTH        | false                        | Enables [client authentication][11].

> <sup>1</sup> The server requires the following extra ports to be opened: __45001-45010__ (TCP/UDP).

</details>

## Usage
Run a public server using `default ports` configuration with a maximum of `20 concurrents games` and a custom `MOTD`:
```bash
docker run -d \
  --name simple64-netplay-server \
  -p 45000-45010:45000-45010/tcp \
  -p 45000-45010:45000-45010/udp \
  -e S64NS_PORT=45000 \
  -e S64NS_MOTD="Don't forget your martini!" \
  -e S64NS_MAXGAMES=20 \
  -i k4rian/simple64-netplay-server
```

## Using Compose
See [compose/README.md][5]

## Manual build
__Requirements__:<br>
— Docker >= __18.09.0__<br>
— Git *(optional)*

Like any Docker image the building process is pretty straightforward: 

- Clone (or download) the GitHub repository to an empty folder on your local machine:
```bash
git clone https://github.com/K4rian/docker-simple64-netplay-server.git .
```

- Then run the following command inside the newly created folder:
```bash
docker build --no-cache -t k4rian/simple64-netplay-server .
```

<!---
## See also
* __[simple64 Netplay Server Egg](https://github.com/K4rian/)__ — A custom egg of the simple64 Netplay Server for the Pterodactyl Panel.
* __[simple64 Netplay Server Template](https://github.com/K4rian/)__ — A custom template of the simple64 Netplay Server ready to deploy from the Portainer Web UI.
--->

## License
[GPL-3.0][6]

[1]: https://simple64.github.io/ "simple64 Project Page"
[2]: https://www.alpinelinux.org/ "Alpine Linux Official Website"
[3]: https://hub.docker.com/_/alpine "Alpine Linux Docker Image"
[4]: https://github.com/K4rian/docker-simple64-netplay-server/blob/master/Dockerfile "Latest Dockerfile"
[5]: https://github.com/K4rian/docker-simple64-netplay-server/tree/master/compose "Compose Files"
[6]: https://github.com/K4rian/docker-simple64-netplay-server/blob/master/LICENSE
[7]: https://github.com/K4rian/docker-simple64-netplay-server/blob/6970f8b95b30746f96b4f1b955de2350999e3786/Dockerfile "Dockerfile v1.1"
[8]: https://github.com/K4rian/docker-simple64-netplay-server/blob/b6a2cc94f7c1344bbe68bb9b6834974c171f6aef/Dockerfile "Dockerfile v1.2"
[9]: https://github.com/mupen64plus/mupen64plus-core "Mupen64Plus-Core Repository"
[10]: https://github.com/Rosalie241/RMG "Rosalie's Mupen GUI (RMG) Repository"
[11]: https://github.com/simple64/simple64-netplay-server/wiki/Client-Authentication "simple64's Client Authentication Wiki entry"