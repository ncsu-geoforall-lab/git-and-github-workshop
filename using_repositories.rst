Migrating repository to GitHub from another hosting option
==========================================================

Get the URL from the old repository host and do a *bare* clone of the repository (using ``--bare`` option)::

    git clone --bare the/repository/url/at/old/host

Create a (remote) repository at GitHub. Create the repository as empty repository without any files (without ``.gitignore``, ``README`` (``README.md``/``README.rst``) and ``LICENCE`` files). Get repository URL from GitHub project .

Go to the directory with *bare* clone of your repository::

    cd repository-name.git

Push the changes using the ``--mirror`` option to upload everything (all branches, tags etc.)::

    git push --mirror the/repository/url/at/new/host

Now you can remove the *bare* clone::

    cd ..
    rm -rf repository-name.git

It is advisable to mark the old remote repository as not active or read only in some way, add note to description or to README file. You can consider also removing the old repository to avoid confusion (the disadvantage is that you loose one backup but anyway this backup will be outdated soon).

If you or your colleagues have the existing clone (local working copy) of the repository, you can change the remote repository URL to the new one (assuming the remote repository is named ``origin`` in most cases)::

    git remote set-url origin the/repository/url/at/new/host

Alternatively, you can clone the repository from the new location and remove you old clone. Just be sure that you don't have any changes in you old clone (both committed and uncommitted) because you will loose them removing the old clone. While changing remote repository URL is safe because you just continue in the same directory with all committed or uncommitted changes.

Alternative guide is available here: https://help.github.com/articles/importing-an-external-git-repository.