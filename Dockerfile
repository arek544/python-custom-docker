FROM python:3.8.7

# install text editor
RUN apt-get update 
RUN apt-get install nano

# creating an environment variable that holds the project directory
ENV PYTHONPATH="/work"
WORKDIR "${PYTHONPATH}"

# ZSH setup
# Uses "git", "ssh-agent" and "history-substring-search" bundled plugins
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -p git \
    -p 'history-substring-search' \
    -p zsh-autosuggestions \
    -a 'bindkey "\$terminfo[kcuu1]" history-substring-search-up' \
    -a 'bindkey "\$terminfo[kcud1]" history-substring-search-down'

# autosuggestions plugin to ZSH
RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Make ZSH the default shell for the current user in the container
RUN echo "exec zsh" >> ~/.bashrc

