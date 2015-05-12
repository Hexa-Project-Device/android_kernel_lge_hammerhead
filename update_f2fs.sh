#!/bin/bash
git fetch f2fs

find . -not -path '*/\.*' -name '*f2fs*' | grep -v 'update_f2fs\|recovery\|ramdisk' | while read f2fs; do rm -rf $f2fs; git checkout f2fs/master -- $f2fs; done

rm -rf fs/f2fs
git checkout f2fs/master -- fs/f2fs

git log --oneline f2fs/linux-3.4 | head -1 | awk '{print $1}' | while read patch; do git cherry-pick --no-commit $patch; done
git cherry-pick --no-commit 6d9dc4b4173b64b2d060aae0e2f9d46180aba310
git cherry-pick --no-commit 4cc871a25931de58496c80ac756de8303d94122e
git cherry-pick --no-commit ebf0ef0ee4d5dc98ff64cac4f7111bc53c8ed356
git cherry-pick --no-commit 407b222fa4acfe43a302a0b095e638a6a33ad175
git status
