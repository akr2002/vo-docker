# vo-docker

[Vendetta Online](https://vendetta-online.com) in a Docker container

Use case: Easy to install on systems that do not follow FHS (Filesystem Hierarchy Standard). Tested on NixOS. Guix users tell your experience.

## Steps:
1. Download client installer into `~/.vendetta`
2. Clone the repo
3. Build the container:
```bash
docker build -t vo .
```
4. Run `xhost +local:` to allow the container to use GUI.
5. Run the container:
```bash
docker run -it --rm -e DISPLAY=$DISPLAY -e ALSA_CARD=sofhdadsp --device /dev/snd --device /dev/dri/card0 -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /home/user/.vendetta:/root/.vendetta vo
```
First time only: Install the client
6. Play as usual.

Next time onwards you just need to follow steps 6 and 7 (and 5 if you shut down your computer).

## Known issues:
1. You cannot write into `~/.vendetta` as unprivileged user on host machine. This is by design. You can always place plugins as root or use the container to do the same.

## Possible issues:
1. You might not get sound. To fix it, run `aplay -l` in the container and use whatever card it displays next time you run the container. Put the value in `ALSA_CARD`.
2. If you have a dedicated GPU, you might consider passing `--gpus all` to the `docker run` command. It should use dGPU. I have not tested it.
