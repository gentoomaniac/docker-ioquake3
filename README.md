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

### server.cfg

```
seta rconPassword "supersecret"
g_motd "Welcome to my Quake3 server"
set bot_enable 1
set dedicated 1
set g_gametype 3
set sv_pure 0
set bot_minplayers 4
set g_allowvote 1
```

### ctf.cfg

Capture the Flag

```
g_motd "Welcome to my Quake3 server: ***now capture the flag***"
sv_maxclients 12

g_gametype 4
g_weaponrespawn 15
g_inactivity 3000
g_forcerespawn 0

seta timelimit 15
seta fraglimit 40
set d1 "map q3ctf1 ; set nextmap vstr d2"
set d2 "map q3ctf2 ; set nextmap vstr d3"
set d3 "map q3ctf3 ; set nextmap vstr d4"
set d4 "map q3ctf4 ; set nextmap vstr d1"
vstr d1
```

### td.cfg

Team Deathmatch

```
g_motd "Welcome to my Quake3 server: ***now team deathmatch***"
sv_maxclients 12

g_gametype 3
g_weaponrespawn 15
g_inactivity 3000
g_forcerespawn 0

seta timelimit 15
seta fraglimit 40
set d1 "map q3dm17 ; set nextmap vstr d2"
set d2 "map q3dm6 ; set nextmap vstr d3"
set d3 "map q3dm16 ; set nextmap vstr d4"
set d4 "map q3dm19 ; set nextmap vstr d1"
vstr d1
```

## Further links

### Get Quake III data files

[Quake III on GOG.com](https://www.gog.com/game/quake_iii_gold)
[Quake III on Steam](https://store.steampowered.com/app/2200/Quake_III_Arena/)

### Make Quake 3 look beautiful

[Here](https://swissmacuser.ch/how-you-want-to-run-quake-iii-arena-in-2018-with-high-definition-graphics-120-fps-on-5k-resolution/) is a great gide on how to make Quake III look beautiful.
Make sure you only take a resolution that your screen supports and don't change the settings in-game.

### Server administration

On [Quake2World](https://www.quake3world.com/q3guide/servers.html) you'll find all you need to now.
