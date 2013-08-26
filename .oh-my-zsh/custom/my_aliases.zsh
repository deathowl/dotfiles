#To store not ustream specific aliases 
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
alias antal="ant test-all"
function wbdelete() {
 	for var in "$@"
	do
		git push origin :$var
		git checkout master
		git branch -D $var
	done
}
alias vgu="vagrant up"
alias vgh="vagrant halt"
alias vgr="vagrant reload"
