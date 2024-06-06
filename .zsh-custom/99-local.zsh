export GITLAB_USERNAME='danielmoore'
export GITLAB_TOKEN='glpat-GzeD4YFrzhnBwpJksXVK'
export AWS_PROFILE=dev-engineer
export AWS_DEFAULT_REGION=us-east-1
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

export N_PREFIX="$HOME/.n"
path+=("$N_PREFIX/bin" "$(pyenv root)/shims")

alias tf=terraform

alias tfswitch="/opt/homebrew/bin/tfswitch -b $HOME/.bin/terraform"

aws-auth() {
  saml2aws login \
  --skip-prompt \
  --profile $AWS_PROFILE \
  --role $(aws configure get ${AWS_PROFILE}.saml2aws_role_arn) \
  --session-duration $(aws configure get ${AWS_PROFILE}.duration_seconds || echo -n 3600) \
  "$@";
  
  #aws eks --region us-east-1 update-kubeconfig --name garnerhealth-services --alias ${AWS_PROFILE};
}

alias app='kubectl -n app'
alias kctx='kubectl config use-context'

alias gam="/Users/daniel/bin/gam/gam"
alias make="/opt/homebrew/bin/gmake"

export EDITOR='subl -nw'