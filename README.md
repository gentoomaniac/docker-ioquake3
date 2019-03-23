# ioquake3 server

The image is based on alpine


## build

- create a folder "data" in the build directory and copy the baseq3 and missionpack folders into it
- download the [patch](https://ioquake3.org/extras/patch-data/) files and put the zip file into the build directory
- run
```shell
# docker build -t ioquake3 .
```

## run

```shell
#  docker run --rm -d -p 27960:27960/udp -v "$(pwd)/server.cfg:/ioquake3/ioquake3/baseq3/server.cfg:ro" ioquake3 +exec server.cfg
```

## example docker-compose

```yaml
version: "3.2"

services:
  ioquake:
    image: ioquake3
    container_name: ioquake3
    command: ["+exec", "server.cfg", "+exec", "td.cfg"]
    ports:
        - 27960:27960/udp
    volumes:
        - "/path/to/ioquake3/server.cfg:/ioquake3/ioquake3/baseq3/server.cfg:ro"
        - "/path/to/ioquake3/td.cfg:/ioquake3/ioquake3/baseq3/td.cfg:ro"
        - "/path/to/ioquake3/ctf.cfg:/ioquake3/ioquake3/baseq3/ctf.cfg:ro"
```

## server configs

[here](configs/)

## Further links

### Get Quake III data files

[Quake III on GOG.com](https://www.gog.com/game/quake_iii_gold)

[Quake III on Steam](https://store.steampowered.com/app/2200/Quake_III_Arena/)

### Make Quake 3 look beautiful

[Here](https://swissmacuser.ch/how-you-want-to-run-quake-iii-arena-in-2018-with-high-definition-graphics-120-fps-on-5k-resolution/) is a great gide on how to make Quake III look beautiful.

Make sure you only take a resolution that your screen supports and don't change the settings in-game.

### Server administration

On [Quake3World](https://www.quake3world.com/q3guide/servers.html) you'll find all you need to now.
