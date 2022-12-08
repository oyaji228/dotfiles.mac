# dotfiles.mac

## dotfilesとは

- 『.vimrc』『.emacs.d』『.zshrc』などの頭にドットがつくファイルを指す
- このdotfilesをGitHubで管理しておいて、「dotfilesリポジトリをクローン+install.shの実行」で、環境構築を楽に行う

## 事前準備
- githubのssh接続するための設定を済ませておく
  - [参考：GitHubでssh接続する手順〜公開鍵・秘密鍵の生成から〜](https://qiita.com/shizuma/items/2b2f873a0034839e47ce)
  

## 使い方
1. 新規環境で、HOMEディレクトリ(~)にGitHubからdotfilesをクローン
```
$ cd ~
$ git clone git@github.com:oyaji228/dotfiles4mac.git
```

2. 実行ファイルに実行権限をつける
```
$ chmod +x ~/dotfiles4mac/link.sh ~/dotfiles4mac/make.sh ~/dotfiles4mac/brew.sh
```

3. powerlineをインストール
- githubを参考にしてインストール
- powerline-fontsとpowerline-shellのインストールが必要
- [powerline-shell_Git_Repository]
- 
4. 初期設定の実行
```
$ cd ~/dotfiles4mac
$ ./make.sh
```





