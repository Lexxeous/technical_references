# Git Management

#Local user info is pulled from /Users/alex/.gitconfig

add .DS_Store and/or dump.rdb to .gitignore_global

git init # initialize the master branch of a new project

git clone <repoURL> # create a new local repo from the repoURL

git status # monitor the current staging status

git checkout -b <branchName> # initialize a new branch off of current branch with descriptive name ; n2pub-XXX-extra
git checkout -- <file> # discard changes done to <file>
git checkout -- . # discard all changes in current directory

git branch # shows list of branches and marks the current working branch
git branch -D <branchName> # delete branchName ; only local
git branch -vv <> # shows which remote branch a local branch is tracking
git branch --set-upstream-to <branchName> # set tracking remote and/or branch
git branch -u <branchName>
git branch --set-upstream-to upstream <branchName>
git branch -u upstream <branchName>

git reset HEAD <file> # unstage <file> from the commit queue
git reset --hard upstream/master #  brute force fresh download/update for local repo

git add/rm <file> # updates the stage for what would potentially be commited
git add <file> # stage a file to the commit queue

git commit -m "message" # commit changes with a "message" about what you did ; awaits to be pushed to a branch

git log # displays command-locked scroll page of commited changes to particular branches ; press 'q' to exit ; displays sha

git push <remoteName> <branchName> # push <branchName> commit queue to <remoteName> repository/forkRepo ; upstream/mine ; HEAD = current working branch
git push --set-upstream <remoteName> <branchName> # push and set default location for a newly created branchName ; must be on first push iterate of branchName
git push -u <remoteName> <branchName> # push and set default location for a newly created branchName ; must be on first push iterate of branchName

git cherry-pick <sha> # pull specific changes from one branch to another based on the unique commit code (sha)

git remote # displays all the avaliable remote git repositories ; not local
git remote add <remoteName> <repoURL> # add access to remote repo
git remote rename <oldName> <newName> # rename any currently accesssable remote repo
git remote remove <remoteName>

git checkout master # revert/rollback to before any changes were made to the cloned master branch ; start of a new story

git fetch <remoteName> <branchName>

git pull upstream <branchName> # update local copy of current working branch with whatever is current in <branchName>

git stash save # put uncommited branch changes on the stack
git stash pop	# pop uncommited branch changes off of the stack

git merge master # merge master branch with current working branch
git merge <branchName> # merge branchName with current working branch

git rev-list --left-right --count upstream/master...<branchName> # show the commit difference count between upstream/master and branchName
git rev-list --left-right --count <leftBranch>...<rightBranch> # show the commit difference count between leftBranch and rightBranch
