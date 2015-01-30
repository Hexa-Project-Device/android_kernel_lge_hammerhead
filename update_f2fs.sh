#!/bin/bash
git fetch f2fs

find . -not -path '*/\.*' -name '*f2fs*' | grep -v 'update_f2fs\|recovery\|ramdisk' | while read f2fs; do rm -rf $f2fs; git checkout f2fs/dev -- $f2fs; done

rm -rf fs/f2fs
git checkout f2fs/dev -- fs/f2fs

git log --oneline f2fs/linux-3.4 | head -1 | awk '{print $1}' | while read patch; do git cherry-pick --no-commit $patch; done
git cherry-pick --no-commit e3200185e1a953b986d55c3623c5c90bad3558ed
git cherry-pick --no-commit e77624855804db26f3b344456278db7fb70516fd
git cherry-pick --no-commit c706c6e4490687f745498f654bc8e67542c08ab9
git status
