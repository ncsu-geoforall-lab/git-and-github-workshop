Basic Git introduction
======================

If there is a existing remote repository, clone the repository (supposing SSH access, using GitHub as an example)::

    git clone git@github.com:repositoryowner/repositoryname.git

Do all the changes in the ``repositoryname`` directory created by the ``git clone`` command.

Once you edit some files, use ``git commit`` to commit them. Use ``-a`` flag to
commit all or specify the filenames to commit just some of them.
Use ``-m "some commit message"`` to describe the changes you made.
The fastest way to commit might be, for example::

    git commit -am "updated for GRASS GIS 7"

If you want to provide a longer commit message, just omit the ``-m "..."`` and
you will get an editor (*nano* text terminal editor by default on GNU/Linux)
where you can write a commit message.

If you created a new file, you have to tell Git to start tracking it::

    git add some_file.txt

If you want to delete or move files, use ``git rm`` and ``git mv``::

    git rm apples.txt
    git mv oranges.txt fruits.txt

To see what files where changed, added or deleted use ``git status``::

    git status

To review the changes in the files use ``git diff``::

    git diff
    git diff some_file.txt
    git diff some_directory

The commit itself records the change locally but does not put the change
to the remote repository.
Once you are ready to share your changes with others use ``git push``
to put the changes to the remote repository.
All commits which were not pushed yet will by pushed.

::

    git push

To get the changes of other contributors use ``git pull``::

    git pull

You always have to pull before you push. It is often necessary to commit
your changes before ``git pull`` otherwise Git will not be able to merge
the incoming changes. Git will try to merge the changes automatically.
If you get an editor with a message about merging,
it is enough just to use the generated message by saving the file and
exiting the editor (using Ctrl+X in case the editor is *nano*).

If the automatic merge is not possible, Git will put the conflicting parts
into the files and mark them. Consult the further steps with other contributors.
