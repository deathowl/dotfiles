#To store not ustream specific aliases 
alias antal="ant test-all"
function wbdelete() {
 	for var in "$@"
	do
		git push origin :$var
		git checkout master
		git branch -D $var
	done
}

function gitstat() {
	git log --author=$@ --pretty=tformat: --numstat \
		| gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
}
alias vgu="vagrant up"
alias vgh="vagrant halt"
alias vgr="vagrant reload"
alias vsh="vagrant ssh"
alias vape="vagrant provision"
alias vdf="vagrant destroy -f"
alias gf="git fetch"
alias gpu="git pull"
alias gall="git add ."
alias gs="git st"
alias grh="git reset --hard"
alias eba=". env/bin/activate"
alias pir="pip install -r requirements.txt"
alias idk='echo ".idea" >> .gitignore ; git add .gitignore ; git commit -m "i have no idea"'
alias askype="apulse32 skype"
alias ccat="pygmentize -g"

function cless() {
	ccat $1 2>/dev/null | less	
}
