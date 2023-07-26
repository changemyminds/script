FROM codercom/code-server:latest

USER root

# install apt-get packages
RUN sudo apt-get update \
    && sudo apt-get install -y curl git zsh make binutils bison build-essential gcc \
    apt-transport-https ca-certificates curl gnupg lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key --keyring /etc/apt/trusted.gpg.d/docker.gpg add -

RUN echo \
  "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -y docker-ce-cli

USER coder

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc \
    && bash -c "source ~/.zshrc && nvm install 18.16.1 && nvm alias default 18.16.1 && npm install -g commitizen cz-conventional-changelog cz-customizable && echo '{ \"path\": \"cz-customizable\" }' >> ~/.czrc"

# install gvm
RUN bash -c "bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)" \
    && echo '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"' >> ~/.zshrc \
    && bash -c "source ~/.zshrc && gvm install go1.20.5 -B && gvm use go1.20.5 --default && go install -v golang.org/x/tools/gopls@latest && go install -v github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949"

# install startship
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y \
    && echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# install VSCode extension
RUN code-server --install-extension golang.Go \
    && code-server --install-extension k--kato.intellij-idea-keybindings \
    && code-server --install-extension mhutchie.git-graph \
    && code-server --install-extension Vue.volar \
    && code-server --install-extension Vue.vscode-typescript-vue-plugin \
    && code-server --install-extension antfu.vite \
    && code-server --install-extension vscode-icons-team.vscode-icons \
    #&& code-server --install-extension Lokalise.i18n-ally \
    && code-server --install-extension esbenp.prettier-vscode \
    && code-server --install-extension dbaeumer.vscode-eslint \
    && code-server --install-extension yzhang.markdown-all-in-one \
    && code-server --install-extension DavidAnson.vscode-markdownlint \
    && code-server --install-extension humao.rest-client \
    && code-server --install-extension GitHub.github-vscode-theme \
    && code-server --install-extension bradlc.vscode-tailwindcss

# set zsh to the default shell
RUN sudo chsh -s $(which zsh)
