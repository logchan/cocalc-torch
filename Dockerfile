FROM sagemathinc/cocalc:latest
RUN python3 --version

# CUDA
RUN wget https://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb -O /tmp/cuda-repo.deb
RUN dpkg -i /tmp/cuda-repo.deb
RUN rm /tmp/cuda-repo.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt update
RUN apt install -y cuda-tools-10-1 cuda-runtime-10-1 cuda-libraries-10-1

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.1"

# Common software
RUN apt update && apt install -y --no-install-recommends \
            build-essential \
            python3 \
            python3-pip \
            python3-setuptools \
            vim \
            unzip \
            && rm -rf /var/lib/apt/lists/*

RUN python3 --version
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade scipy matplotlib pillow scikit-image
RUN pip3 install torch==1.4.0 torchvision

# Volume
RUN mkdir /projects
VOLUME /projects

CMD /root/run.py
