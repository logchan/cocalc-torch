FROM sagemathinc/cocalc:latest
RUN python3 --version

# CUDA
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb -O /tmp/cuda-repo.deb
RUN dpkg -i /tmp/cuda-repo.deb
RUN rm /tmp/cuda-repo.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt update
RUN apt install -y cuda-tools-10-0 cuda-runtime-10-0 cuda-libraries-10-0

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=10.0"

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
RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.0.0-cp36-cp36m-linux_x86_64.whl

# Volume
RUN mkdir /projects
VOLUME /projects

CMD /root/run.py

