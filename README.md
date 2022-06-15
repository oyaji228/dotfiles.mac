# dotfiles.mac

## dotfilesとは

- 『.vimrc』『.emacs.d』『.zshrc』なんかの「頭にドットがつくファイル」
- このdotfilesをGitHubで管理しておいて、「dotfilesリポジトリをクローン+install.shの実行」で、環境構築を楽に行う

## 使い方
1. 新規環境で、HOMEディレクトリ(~)にGitHubからdotfilesをクローン
```
$ cd ~
$ git clone https://github.com/oyaji228/dotfiles4mac.git
```

2. 実行ファイルに実行権限をつける
```
$ chmod +x ~/dotfiles4mac/setup.sh
```

4. 初期設定の実行
```
$ ~/dotfiles4mac/setup.sh
```





