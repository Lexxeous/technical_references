<!-- Git Management -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="90px"/> Lexxeous's Git Management: <img src="../.pics/Git/github_logo.png" width="90px"/>

### Manage Git Repositories, Remotes, & Branches.

Local user info is pulled from `~/.gitconfig`.

#### Create a Global Git Ignore:
```sh
touch .gitignore_global # create the .gitignore_global file
git config --global core.excludesfile ~/.gitignore_global # declare the global .gitignore
open .gitignore_global
```
> Create a local git ignore with `touch .gitignore` in any project; Add files like .DS_Store and dump.rdb to .gitignore_global to remove them from all project commits.

#### Remove already committed files from future commits:
```sh
git rm --cached path/to/file # removes file from git commit cache
git rm --cached -r path/to/dir # recursively removes all files within <dir> from git commit cache
```
> These commands only remove the file reference(s) from the Git commit cache; this does not affect the local copies of files or directories stored on your computer. Future commits will no longer include the desired file(s) and/or folder(s).

#### Create New Git Repository from Command Line:
```sh
# Using the Git API.
curl -u 'username' https://api.github.com/user/repos -d '{"name":"repo_name"}'
```

#### Initialize a Git Project:
```sh
# Initialize the master branch of a new project.
git init 
```

#### Create a local copy of a Git Repository:
```sh
# Create a new local repo from <repoURL>.
git clone <repoURL>
```

#### Navigate Branches:
```sh
git checkout -b <branchName> # initialize a new branch off of current branch with descriptive name
git checkout -- <file> # discard changes done to <file>
git checkout -- . # discard all changes in current directory
git checkout <branchName> # move workign branch to <branchName>
```

#### Manage Git Remotes and Branches:
```sh
git branch # shows list of branches and marks the current working branch
git branch -D <branchName> # delete branchName ; only local
git branch -v <> # shows which remote branch a local branch is tracking

# Set tracking remote and/or branch
git branch --set-upstream-to <branchName>
git branch -u <branchName>
git branch --set-upstream-to upstream <branchName>
git branch -u upstream <branchName>
```

#### Reset Git Changes:
```sh
git reset HEAD <file> # unstage <file> from the commit queue
git reset --hard upstream/master # brute force fresh download/update for local repo
```

#### Manage Commit Queue:
```sh
git add/rm <file> # updates the stage for what would potentially be commited
git add <file> # stage a file to the commit queue
git add . # add all changes (in currrent directory) files to the commit queue
git commit -m "message" # commit changes with a "message" about what you did ; awaits to be pushed
git commit --ammend
```

#### View Current Branch Information:
```sh
git log # displays space-locked scroll page of commited changes to a particular branch ; press 'q' to exit ; displays <sha>
git status # monitor the current staging status
```

#### Manage Branch Pushes:
```sh
git push <remoteName> <branchName> # push <branchName> commit queue to <remoteName> repository/forkRepo ; upstream/mine
git push --force <remoteName> <branchName> # force push <branchName> to <remoteName>
git push --set-upstream <remoteName> <branchName> # push and set tracking remote/branch ; must be on first push
git push -u <remoteName> <branchName> # shorthand for above command
git push <remoteName> HEAD:<branchName> # push a detached head to a remote branch

git push heroku master # push master branch for production after application setup
```

#### Merge Particular Branch Changes:
```sh
# Merge specific changes to working branch based on the unique commit code <sha>.
git cherry-pick <sha> 
```

#### Manage Git Remotes:
```sh
git remote # displays all the avaliable remote git repositories ; not local
git remote -v # also displays fetch/pull for <repoURL>
git remote add <remoteName> <repoURL> # add access to remote repo
git remote rename <oldName> <newName> # rename any currently accesssable remote repo
git remote remove <remoteName> # remove remote
```

#### Update Local Git Repository:
```sh
git fetch <remoteName> <branchName> # fetch changes from remote
git pull <remoteName> <branchName> # update local copy of current working branch

# If working branch is tracking a remote/branch.
git fetch
git pull
```

#### Save Changes for Later:
```sh
git stash save # put uncommited branch changes on the stack
git stash pop	# pop uncommited branch changes off of the stack
```

#### Local Merging:
```sh
git merge master # merge master branch with current working branch
git merge <branchName> # merge branchName with current working branch
```

#### View Commit Differenes:
```sh
git rev-list --left-right --count upstream/master...<branchName> # show the commit difference count between upstream/master and branchName
git rev-list --left-right --count <leftBranch>...<rightBranch> # show the commit difference count between leftBranch and rightBranch
```

#### Rebase Branches:
```sh
git rebase -i <sha> # edit commits strictly after <sha>
```

#### Bisect Management:
```sh

```


#### Specific File Changes:
```sh
git blame # shows what revision and author last modified each line of a committed file
git diff # "git blame" does not show lines deleted or replaced, but "git diff" does
```

#### Login, PAT, and SSL:
```sh
# Authenticate when cloning using username and password or PAT
git clone https://<username>:<password_or_PAT>@github.com/username/repository.git

fatal: unable to access "<repo>".git: SSL certificate problem: unable to get local issuer certificate

# Can temporarily fix fatal error by disabling ssl, but this is a security risk, reenable ASAP
git config --global http.sslVerify { true | false }
```