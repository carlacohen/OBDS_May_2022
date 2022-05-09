# Cheatsheet - Git

## Table of contents

- [Configure Git](#configure-git)
- [Using Git over SSH](#using-git-over-ssh)
- [Clone an existing GitHub repository](#clone-an-existing-github-repository)
- [Working with Git](#working-with-git)
  - [Working directory](#working-directory)
  - [Repository status](#repository-status)
  - [Pull updates](#pull-updates)
  - [Create a branch](#create-a-branch)
  - [OBDS setup: template and copies](#obds-setup-template-and-copies)
  - [R project](#r-project)
  - [Saving your work](#saving-your-work)
  - [Pull requests, reviews, and merge](#pull-requests-reviews-and-merge)
  - [Cleaning up](#cleaning-up)
- [More commands](#more-commands)
  - [Remotes](#remotes)
  - [Undoing mistakes](#undoing-mistakes)

## Configure Git

On each computer you want to use Git, set global settings once:

```bash
git config --global user.name
git config --global user.email
git config --global core.editor
```

## Using Git over SSH

On each computer you want to use Git, create an SSH key once:

```bash
ssh-keygen -t rsa -b 4096
cat ~/.ssh/id_rsa.pub
```

Copy and paste the public key in the GitHub website account profile, under "Settings > SSH and GPG keys".

## Clone an existing GitHub repository

Optionally (and if you don't have one already), make a new folder dedicated to Git repositories on your computer and move into it:

```bash
mkdir git
cd git
```

Then, clone the shared repository for the course (adapt the command below to the correct repository address):

```bash
git clone git@github.com:address
```

## Working with Git

### Working directory

> Note: Your working directory must be inside the folder of the Git repository that you want to work on.

### Repository status

Check the status of the git repository (e.g., up to date, nothing to commit, or with untracked files that you may want to commit):

```bash
git status
```

### Pull updates

Update a local branch (on your computer) with any more recent update available on the corresponding remote branch (on GitHub), if any.

```bash
git pull
```

> Note: In RStudio, `git pull` can also be achieved in the Git integration pane, using the blue arrow facing down.

### Create a branch

Create a new branch (best practice is to _not_ work on the `master` branch).

```bash
git checkout -b unique_branch_name (# creates a branch and moves you to it)
```

> Note: In this course, we often give you template files to get your started for the day.
> However, we expect you to make a copy of that template, so that your work does not conflict with anyone else.

### OBDS setup: template and copies

Make a copy of the template:

```bash
cp template.Rmd unique_template_name.Rmd
```

If it is a folder, use the recursive option:

```bash
cp -r template unique_template_name
```

> Note: In RStudio, this can also be achieved using the lower right pane "Files", under "More > Copy To".

### R project

Launch the R project (e.g., click the `.Rproj` file).

When the RStudio application has switched to the new R project, create a new R markdown file or R script.

### Saving your work

```
git status     # checking the status is always a good idea
git add <file> # add individual files to the staging area
git status     # (see above)
git commit -m "type a message" # commit the changes currently in the staging area
git status     # (see above)
git push -u origin <branch_name> # -u push and link the local branch to the remote of the same name
git status     # (see above)
```

> Note: The steps above can also be achieved using the Rstudio Git integration pane.
> In the Git panel:
> - Make sure you are on the branch.
> - Tick the files to mark for commit.
> - Click on the "Commit" button.
> - Type a commit message in the window.
> - Click on the "Commit" button.
> - Click on the "Push" button (with a green arrow facing upward)


### Pull requests, reviews, and merge

In the previous section `git push -u ...` and the "Push" button both display a message with an `https://` link to GitHub.
This link is a shortcut to create a pull request for the branch that was just pushed.

- Follow the link
- Click on the green button to create the pull request
- Merge the pull request when it is approved

### Cleaning up

Once the pull request is merged, delete the branch from the repository (both on GitHub and locally).
Return to the Terminal:

```bash
git status.                 # always a good idea
git checkout master         # switch to the master branch
git status                  # 
git fetch --prune           # delete the local link to the remote branch
git branch -a               # list all the known branches
git branch -d branch_name   # delete the local copy of the branch
```

## More commands

### Remotes

Inspect / add / remove remote repositories connected to the local one.

```bash
git remote -v
git remote add origin git@github.com:address # adapt the address accordingly
git remote rm origin
```

### Undoing mistakes

If you added a file to commit by mistake (but you haven't committed yet).

```bash
git restore --staged <file_name>
```

If you want to delete the last commit while keeping the current state of your files.

```bash
git reset --soft HEAD^
```

If you want to delete the last _two_ commit while keeping the current state of your files (adapt to undo the last _N_ commits).

```bash
git reset --soft HEAD^2
```

If you want to add a new commit that cancels out (i.e., does exactly the opposite of) an earlier commit in the repository.

```bash
git revert <commit>
```

# Credits

- Mariolina Salio (alumni)
- Kevin Rue-Albrecht
