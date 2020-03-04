# dotfiles

## 使い方
homeディレクトリでgit clone
./install.sh
でホームディレクトリにシンボリックリンクを張ります。

## molokai
このリポジトリにはmolokaiがサブモジュールとして追加されています。
./pull_molokaiでダウンロードから、vimへの設定まで行います。
install.shとどちらが先でも問題ありません。

### sparsecheckoutについて
現在有効にしていないが、　sparse checkout というのを使うことでサブモジュールの特定のファイルだけを落としてくることができる模様。
git submodule update --init
したあと、
.git/modules/${submodule}/info/sparse-checkout
に特定のディレクトリを記載し、
git config core.sparsecheckout true
することでそのディレクトリのみを落とせるよう。

molokaiなら、
```
mkdir -p .git/modules/molokai/info/
echo '/colors' > .git/modules/molokai/info/sparse-checkout
git config core.sparsecheckout true
#上記sparsecheckoutの設定反映
git read-tree -mu HEAD
```
をpull_molokai.shのupdateあとに追加すれば、color配下のみを落とすことができるらしい。

（未確認かつmolokaiに対してやる必要は余り感じないが勉強のため記載。）
