Working with branches
=====================

    git branch my_branch
    git checkout my_branch

    git checkout -b my_branch

Can be used even with local changes

    git checkout master

    git push --set-upstream origin my_branch

::

    git cherry-pick 51ef1b3


    git merge experiment

    git checkout master
    git merge my_branch

If our originally experimental branch is so good that we want to use it
instead of the master branch, we can, in our branch, merge with
the master branch (``git merge master``) but preferring our state
(``--strategy=ours``). This will create a node in our branch which
is a child of last node in master branch. Then we commit in our branch
and switch to master branch and merge with our branch.

::

    git checkout our_branch
    git merge --strategy=ours --no-commit master
    git commit -am "replacing master with our_branch which is in better shape"
    git checkout master
    git merge our_branch

    git stash
    ...
    git checkout -b new-branch
    git stash apply
