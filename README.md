# handson-docker

## はじめに
- このリポジトリはJBグループ向けのdockerを使用した開発をするためのハンズオン用です
- Windows環境を前提としています
- 初めてdockerにチャレンジする人を対象としています

## ハンズオンのゴール
- Dockerを使った開発のきっかけを作れる


## 事前準備
- dockerのインストール
   - Windows 10 [Docker for Windows](https://docs.docker.com/docker-for-windows/
)
   - Windows 7 or 8 or 8.1  [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/#what-you-get-and-how-it-works) 

- gitのインストール
  - [git for windows](https://gitforwindows.org/)

- Visual Studio Codeのインストール
  - [Visual Studio Code for Windows](https://code.visualstudio.com/)

- GitHub ユーザー作成
  - https://github.com/

- Docker Hub ユーザー作成
  - https://hub.docker.com/

## 基本操作
### コンテナを動かすチュートリアル
- docker hubへのログイン  
  ```
  docker login -u <ユーザー名> -p <パスワード>
  ```
- docker image の検索  
  ```
  docker search <イメージ名>
  ```
- イメージの取得
  ```
  docker pull <イメージ名>
  ```
- イメージの確認
  ```
  docker images <イメージ名>
  REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE  
  nginx                                      latest              dbfc48660aeb        2 weeks ago         109MB
  ```
- コンテナの起動
  ```
  docker run <イメージ名>
  ```
  #### 主なオプション  
  -d                                                   // デーモン実行  
  -e <環境変数名>=<値>                                  // 環境変数を渡す  
  -p <ホストのポート>:<コンテナのポート>		          // ホストマシンのポートとリンク  
  -v <ホストのディレクトリ>:<コンテナのディレクトリ>	   // ローカルディスクをマウント  
  --name <名前>				                           // コンテナに名前を指定  

  例)
  ```
  docker run -d -p 80:18080 nginx
  ```
  起動したらブラウザでhttp://localhost:18080へアクセス  
  nginxのトップページが表示されれば成功

- コンテナの一覧表示
  ```
  docker ps
  ```
- コンテナの詳細表示
  ```
  docker insepct <コンテナID or コンテナ名>
  ```
- コンテナのログ表示
  ```
  docker logs <コンテナID or コンテナ名>
  ```
- コンテナの停止 
  ```
  docker stop <コンテナID or コンテナ名>
  ```
- 停止していたコンテナの起動
  ```
  docker start <コンテナID or コンテナ名>
- コンテナの削除
  ```
  docker rm <コンテナID or コンテナ名>
  ```
- コンテナイメージの削除
  ```
  docker rmi <イメージID>
  ```

### Docker file

## 開発ハンズオン

### ハンズオンのイメージ

### 