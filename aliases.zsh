alias glb="git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"

func gaal() {
  vim ~/.oh-my-zsh/custom/aliases.zsh  
}
alias gmsg='git add ..; git commit -m'
function gcosm() {
  gco $1
  git submodule update --recursive
}

function glco() {
  gl ${$1%%/*}
  gco ${i#*/}
}

alias gpn='git push -u'
alias grbi='git rebase -i --autosquash'
alias grbid='git rebase -i develop --autosquash'
alias grbim='git rebase -i master --autosquash'
function gaba() {
  ga ..  
  git absorb --and-rebase
}
alias gabaa='gaba --base'
alias gabad='gabaa develop'
alias gas='git ir --autosquash'
alias gg='git g'
alias ggl='git gl'
alias gam='git amend'
alias game='gam --edit'
alias gaam='git aamend'

function gfu() { 
  TARGET=$(git rev-parse $1); 
  git commit --fixup=$TARGET ${@:2} && EDITOR=true 
  git rebase -i --autostash --autosquash $TARGET^ 
}

alias gafu='ga .; gfu'
func gclsm() {
  git clean -xfd
  git submodule foreach --recursive git clean -xfd
  git reset --hard
  git submodule foreach --recursive git reset --hard
  git submodule update --init --recursive
  say "git clean completed"
}
alias gcoprj='gco ../*.xcodeproj/project.pbxproj'
alias gcoprjp='gcoprj -p'
alias gcb='git branch | sed -n -e "s/^\* \(.*\)/\1/p"'
alias gnp='git push -u origin $(gcb)'
alias gup='git push -u upstream $(gcb)'
alias gnup='git push -u upstream $(gcb)'
alias gaprj='ga ../*.xcodeproj/project.pbxproj'
alias gaprjp='ga ../*.xcodeproj/project.pbxproj -p'
alias grnd='ga .; gc -m "++Round."'
alias grbud='grb upstream/develop'
alias gcod='gco develop'
alias gacm='ga .; gcmsg $1'
alias gwipi='gacm "++Wip."'
alias grnd='gacm "++Round."'
alias gdn='gd --name-status'

function gnb() {
  git checkout develop
  git pull
  git submodule update --recursive
  git checkout -b $1
}

function grbp() {
  branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  git checkout $1
  git pull
  git checkout $branch
  git rebase $1
}

# pull develop and then rebase
function grbpd() {
  #branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  #git checkout develop
  #git pull
  #git checkout $branch
  #git rebase develop
  grbp develop
}

# pull master and then rebase
function grbpm() {
  branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  git checkout master
  git pull
  git checkout $branch
  git rebase master
function gflfs() {
  git lfs migrate import --everything --include='{$1:*}'
}

alias gbrl="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' --count=10"
}

alias gsm='git submodule update --recursive'

function grhprj() {
  ga ../*.xcodeproj/
  grh ../*.xcodeproj/
  gco ../*.xcodeproj/
}

function gbrf() {
  gb -f $1
}
