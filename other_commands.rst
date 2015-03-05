Other Git commands
==================

This is a selection of commands which are not essential but are very
useful and still quite easy.


Committing just certain changes
-------------------------------

Review changes in certain files::

    git diff some_file.txt some_other_file.txt

Commit just certain files::

    git commit some_file.txt some_other_file.txt -m "message"

Review changes but don't show any whitespace changes::

    git diff --ignore-space-change



Removing changes, fixing mistakes and getting older versions
------------------------------------------------------------

When you have some local changes in a file and you don't want them
anymore. You can get back to last committed version using::

    git checkout some_file.txt

    git reset --hard

    git revert --no-edit 51ef1b3

``--no-edit`` if we don't want to change commit message
(default message is ``Revert "original commit message"``).
If ``--no-commit`` is provided as parameter, automatic commit is not executed.

::

    git commit --amend -m "new commit message"


Saving unfinished changes
-------------------------

To save the changes without actual commit use::

    git stash

``git stash`` removes the local changes from the directory but keeps
them in the local repository. So, you can get the changes back using::

    git stash apply

Often you want to include also ``--index`` to restore exact state
of what is prepared for commit (staged)::

    git stash apply --index


Exploring the history of changes
--------------------------------

::

    git log --graph --oneline


Ignoring some files or directories in the repository
----------------------------------------------------

When we use ``git status`` can see files or directories which are
present in the directory with repository clone but are not tracked using
Git. Sometimes it means that we should add them to the repository but
sometimes these can be some generated files or backup files from some
text editors which we don't want to track. These files would be always
visible in ``git status``, although we don't wish to track them.
In this case we can use ``.gitignore`` file where we specify
which files or directories should be ignored by Git.

Which files are ignored depends on the project, for C and C++ projects
we typically want ``.c``, ``.cpp`` and ``.h`` files to be tracked,
while ``.o`` are intermediate product of compilation. For Python,
we usually track ``.py`` files but we are ignoring ``.pyc`` files.
So, in case of project written in Python and our editor creating
backup files which ends with ``~`` (tilde), our ``.gitignore``
file would have the following contents::

    *.pyc
    *~

The ``.gitignore`` file is using unix-style file matching patterns,
so ``*`` (start) means any character or characters.

Git will look to the ``.gitignore`` file once it is in the directory.
However, in most cases we want to share this file also with our coworkers
or we want to track it and backup it. Thus we should tell Git to version
the file using::

    git add .gitignore

Note and don't forget the dot at the beginning of ``.gitignore``.
The dot is a naming convention for hidden and configuration files
in unix-like system.


Managing files and directories in detail
----------------------------------------

When we create a file or directory, Git does not start to version it
automatically, we have to tell this to Git using ``git add``.
Adding a directory will also add its current content.

::

    git add some_file.txt
    git add some_directory

Renaming, moving and deleting files or directories should be done
using Git, so that Git knows about it and can track this change.

::

    git rm apples.txt
    git mv oranges.txt fruits.txt

Use ``git status`` to keep track of the changes in files and directories::

::

    git status

Cloning a repository
--------------------

By default, when we clone a repository, the directory name of the local
repository is the same as the name of the repository. For example,
cloning cloning repository ``useful-project`` at GitHub from user
``john``, will create a directory ``useful-project`` in the current
working directory.

::

    git clone github.com/john/useful-project.git

Now we would have directory ``useful-project`` with a clone of the
repository. If we want to create a directory with a custom name,
we have to specify it as additional parameter::

    git clone github.com/john/useful-project.git johns-useful-project

Now we would get directory ``johns-useful-project``. In general, the
syntax is::

    git clone url/of/a/repository custom_directory_name

If we decide later after clone to rename directory with the clone,
we can just use standard tools to do it, for example operating system
file manager or ``mv`` command on unix::

    mv johns-useful-project johns-very-useful-project

We can also more the directory wherever we want. Git itself does not
care about the name or placement of the directory, however some (graphical)
applications for managing Git repositories might need some special care
if the repository was moved or renamed by some other applications.
