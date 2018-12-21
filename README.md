cocalc-torch
===

Docker image based on [cocalc-docker](https://github.com/sagemathinc/cocalc-docker), with CUDA 10 and PyTorch installed.

### What you get

- A docker image running Cocalc + PyTorch + CUDA 10

### Requirements (host)

- Ubuntu 18.04 (you can modify the Dockerfile for other OS distributions)
- Latest Docker installed
- Latest NVidia driver installed
- [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) installed
- About 20GB disk storage
- Experience with Docker

### Usage

- Clone the repository and enter it in bash
- Run `./build-cocalc-torch.sh`
- Edit `create-cocalc.sh`: adjust port mappings AND PROJECTS DIRECTORY
- Run `./create-cocalc.sh`
- Now you have the container `cocalc`. Do whatever you like, e.g. `docker start cocalc`

### Note

- Cocalc does not allow you to access via port 80. However, the port **MUST** be mapped with `-p` to somewhere, because otherwise `EXPOSE 80` will be in effect.