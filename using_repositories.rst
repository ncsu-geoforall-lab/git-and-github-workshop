*All examples suppose that you are using unix-like command line (so, use Git Bash on MS Windows).*


Using Git together with Dropbox
===============================

*Note that this works also for other services and also any file-based backup ways such as USB memory sticks.*

Create a *bare* repository in the Dropbox directory (this one will act as a remote repository)::

    mkdir my_project
    cd my_project
    git init --bare

If you already have some project with some files in a directory, go to that directory and run git commands to initialize the repository::

    cd project_dir
    git init
    git add *
    git commit -am "initial commit"
    git remote add origin ~/Dropbox/my_project
    git push -u origin master

Note that ``git add *`` will add all files in the directory. If you want to add only some specify their names instead of using ``*``.

For the other (basic) workflow, you just need::

    git add some_filename
    git commit -am "describe changes here"
    git push

All commands shall be executed in the directory with the project, not in the directory created in Dropbox directory.


Migrating repository to GitHub from another hosting option
==========================================================

Get the URL from the old repository host and do a *bare* clone of the repository (using ``--bare`` option)::

    git clone --bare the/repository/url/at/old/host

Create a (remote) repository at GitHub. Create the repository as empty repository without any files (without ``.gitignore``, ``README`` (``README.md``/``README.rst``) and ``LICENCE`` files). Get repository URL from GitHub project.

Go to the directory with *bare* clone of your repository::

    cd repository-name.git

Push the changes using the ``--mirror`` option to upload everything (all branches, tags etc.)::

    git push --mirror the/repository/url/at/new/host

Alternatively, if you don't want to migrate all branches but just master branch, you can use:

    git remote set-url origin the/repository/url/at/new/host
    git push -u origin master

Now you can remove the *bare* clone::

    cd ..
    rm -rf repository-name.git

It is advisable to mark the old remote repository as not active, read only or private in some way, add note to description or to README file. You can consider also removing the old repository to avoid confusion (the disadvantage is that you loose one backup but anyway this backup will be outdated soon).

If you or your colleagues have the existing clone (local working copy) of the repository, you can change the remote repository URL to the new one (assuming the remote repository is named ``origin`` in most cases)::

    git remote set-url origin the/repository/url/at/new/host

Alternatively, you can clone the repository from the new location and remove you old clone. Just be sure that you don't have any changes in you old clone (both committed and uncommitted) because you will loose them removing the old clone. While changing remote repository URL is safe because you just continue in the same directory with all committed or uncommitted changes.

Alternative guide is available here: https://help.github.com/articles/importing-an-external-git-repository.