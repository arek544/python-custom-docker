FROM python:3.8.7

# install text editor
RUN apt-get update 
RUN apt-get install nano

# creating an environment variable that holds the project directory
ENV PYTHONPATH="/work"
WORKDIR "${PYTHONPATH}"

# ZSH setup
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git \
    -p 'history-substring-search' \
    -p zsh-autosuggestions 

# autosuggestions plugin to ZSH
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Make ZSH the default shell for the current user in the container
RUN echo "exec zsh" >> ~/.bashrc

