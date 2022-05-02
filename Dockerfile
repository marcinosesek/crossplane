FROM ubuntu:latest

ENV MAINTAINER="Marcin Osesek"
ENV EMAIL="marcin_osesek@o2.pl"

# ENV OS_PACKAGES="bash curl unzip groff python3 py3-pip git openssh-keyge"
ENV OS_PACKAGES="curl python3-pip unzip git wget apt-utils"

# ENV TERRAFORM_VERSION="1.1.2"
# ENV TERRAFORM_REPO_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# ENV TERRAGRUNT_VERSION="0.35.20"
# ENV TERRAGRUNT_REPO_URL="https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64"

ENV KUBECTL_REPO_URL="https://dl.k8s.io/release/"

ENV HELM_VERSION="v3.8.2"
ENV HELM_FILE_NAME="helm-${HELM_VERSION}-linux-amd64.tar.gz"
ENV HELM_REPO_URL="https://get.helm.sh/${HELM_FILE_NAME}"

ENV TOOLS_WORKDIR="/tools"
# ENV TERRAFORMRC="${TOOLS_WORKDIR}/.terraformrc"

ENV USER_NAME="dev-user"
WORKDIR ${TOOLS_WORKDIR}

RUN apt-get update && \
    apt-get install -y ${OS_PACKAGES} && \
    useradd ${USER_NAME} -d ${TOOLS_WORKDIR} && \
    chown -R ${USER_NAME}:${USER_NAME} ${TOOLS_WORKDIR} && \
    # curl ${TERRAFORM_REPO_URL} -o terraform-${TERRAFORM_VERSION}.zip && \
    # unzip terraform-${TERRAFORM_VERSION}.zip && mv ./terraform /usr/local/bin/ && rm -rf terraform-${TERRAFORM_VERSION}.zip && \
    # touch ~/.bashrc && terraform -install-autocomplete && terraform --help && \
    # wget ${TERRAGRUNT_REPO_URL} -O ./terragrunt && chmod +x terragrunt && mv ./terragrunt /usr/local/bin/ && \
    curl ${HELM_REPO_URL} -o ${HELM_FILE_NAME} && \
    tar -zxvf ${HELM_FILE_NAME} && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-* && \
    pip install awscli && \
    echo "=== Configure git ===" && \
    git config --global user.name "${MAINTAINER}" && \
    git config --global user.email "${EMAIL}" && \
    echo "=== Install kubectl ===" && \
    curl -LO "${KUBECTL_REPO_URL}$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/kubectl && \
    kubectl version --client

USER ${USER_NAME}
