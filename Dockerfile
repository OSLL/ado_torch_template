FROM duckietown/dt-core:daffy-arm64v8

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all

ENV CUDA_VERSION 10.2.89
ENV CUDA_PKG_VERSION 10-2=$CUDA_VERSION-1
ENV NCCL_VERSION 2.8.4
ENV CUDNN_VERSION 8.1.1.33

ENV PYTORCH_VERSION 1.7.0
ENV PYTORCHVISION_VERSION 0.8.0a0+2f40a48

ENV TENSORRT_VERSION 7.1.3.4

ENV PYCUDA_VERSION 2021.1

ARG PIP_INDEX_URL="https://pypi.org/simple"
ENV PIP_INDEX_URL=${PIP_INDEX_URL}

RUN ln -s /usr/local/cuda-10.2 /usr/local/cuda

COPY arm64v8.sh install.sh

RUN bash install.sh

