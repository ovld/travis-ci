FROM ubuntu:18.04


RUN apt-get update && \
    apt-get install -y unzip wget python3 sudo python3-pip

RUN wget https://releases.hashicorp.com/packer/1.5.5/packer_1.5.5_linux_amd64.zip && \
    unzip packer_1.5.5_linux_amd64.zip && \
    rm packer_1.5.5_linux_amd64.zip && \
    mv packer /usr/bin/ && \
    chmod +x /usr/bin/packer

RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip && \
    unzip terraform_0.12.24_linux_amd64.zip && \
    rm terraform_0.12.24_linux_amd64.zip && \
    mv terraform /usr/bin/ && \
    chmod +x /usr/bin/terraform

RUN wget https://github.com/terraform-linters/tflint/releases/download/v0.15.4/tflint_linux_amd64.zip && \
    unzip tflint_linux_amd64.zip && \
    mv tflint /usr/bin/ && \
    chmod +x /usr/bin/tflint


RUN pip3 install ansible ansible-lint

WORKDIR /tests

CMD ["/sbin/init"]
