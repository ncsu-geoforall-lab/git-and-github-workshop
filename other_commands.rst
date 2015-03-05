Other Git commands
==================

This is a selection of commands which are not essential but are very
useful and still quite easy.

    git checkout some_file.txt

    git clone url/of/a/repository custom_directory_name

    Commit just certain files:

    git diff some_file.txt some_other_file.txt
    git commit some_file.txt some_other_file.txt -m "message"

    git reset --hard

    git revert --no-edit 51ef1b3

``--no-edit`` if we don't want to change commit message
(default message is ``Revert "original commit message"``).
If ``--no-commit`` is provided as parameter, automatic commit is not executed.


    git diff --ignore-space-change

    git commit --amend -m "new commit message"

    git stash

    git stash apply
    git stash apply --index

    git log --graph --oneline

