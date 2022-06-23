FROM codercom/code-server:4.4.0

WORKDIR /home/coder

# set environment variables
ENV TZ="America/Belem"

# Install OS packages
RUN sudo apt-get update -yq \
    && sudo apt-get install -yq --no-install-recommends wget unzip screen nano htop ranger \
    && sudo apt-get install -yq python3 python3-pip git zsh vim curl gnupg tree \
    && pip install --no-cache-dir --user glances

# Install OhmyZSH
RUN yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
# Miniconda
ARG MINICONDA=Miniconda3-py38_4.10.3-Linux-x86_64.sh
RUN wget https://repo.anaconda.com/miniconda/$MINICONDA \
    && bash $MINICONDA -b -p $HOME/miniconda \
    && rm -f $MINICONDA \
    && $HOME/miniconda/bin/conda init zsh
