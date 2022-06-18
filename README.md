# dotfiles.mac

## dotfilesとは

- 『.vimrc』『.emacs.d』『.zshrc』などの頭にドットがつくファイルを指す
- このdotfilesをGitHubで管理しておいて、「dotfilesリポジトリをクローン+install.shの実行」で、環境構築を楽に行う

## 使い方
1. 新規環境で、HOMEディレクトリ(~)にGitHubからdotfilesをクローン
```
$ cd ~
$ git clone https://github.com/oyaji228/dotfiles4mac.git
```

2. 実行ファイルに実行権限をつける
```
$ chmod +x ~/dotfiles4mac/link.sh ~/dotfiles4mac/make.sh ~/dotfiles4mac/brew.sh
```

3. powerlineをインストール
- githubを参考にしてインストール
- https://github.com/b-ryan/powerline-shell
- powerline-fontsとpowerline-shellのインストールが必要


4. 初期設定の実行
```
$ ~/dotfiles4mac/make.sh
```





