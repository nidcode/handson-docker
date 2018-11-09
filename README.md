# handson-docker

## はじめに
- このリポジトリはJBグループ社内向けのdockerを使用した開発ハンズオン用です
- Windows環境を前提としています
- 初めてdockerにチャレンジする人を対象としています

## ハンズオンのゴール
- Dockerを使った開発のイメージをもってもらう


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
コマンドのオプションは-hで確認しましょう
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
  docker run -d -p 18080:80 nginx
  ```
  起動したらブラウザでhttp://localhost:18080へアクセス  
  nginxのトップページが表示されれば成功

- コンテナの一覧表示
  ```
  docker ps
  ```
- コンテナの詳細表示
  ```
  docker inspect <コンテナID or コンテナ名>
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

### Dockerfile
#### オレオレnginxコンテナを作ろう
- Dockerfileの作成(お好きなエディタで以下を作成し、「Dockerfile」という名前で保存)
  ```
  FROM debian:buster-slim
  MAINTAINER メンテナ名 <メールアドレス>
  RUN apt-get update && apt-get install nginx -y
  EXPOSE 80
  CMD ["nginx", "-g", "daemon off;"]
  ```
  サンプル: nginx/Dockerfile

- イメージの作成
  ```
  docker build [–t タグ] <Dockerfileのあるディレクトリ>
  ```

### Docker Compose
#### オレオレnginxコンテナを Docker Compose で起動しよう
- docker-compose.ymlの作成
  ```
  version: '3'
  services:
    web:
      build:
        context: .
      ports: 
         - "80:80"
  ```

- docker-composeでの起動
  ```
  docker-compose up
  ```

サンプルが```./nginx```にあります

## 開発ハンズオン

これをベースにする
http://docs.docker.jp/compose/django.html

### ハンズオンのイメージ


### 初期構成
![初期構成](./images/handson-init.png "ハンズオン初期構成")

1. 当リポジトリをcloneする
  ```git clone https://github.com/nidcode/handson-docker.git```

2. コンテナを起動する
　※docker imageをpullするので、テザリング等で実施するのはお控えください。
    - ```cd docker-handson```
    - ```docker-compose run app python mysite/manage.py runserver```

3. 動作を確認する
    - ブラウザから```http://localhost/api/v1/messages/1```を表示
    - [wahhoi!]と表示されます

4. コンテナを終了する
    - ``` docker-compose down```

5. コードを追加する
    - サンプルを見ながら頑張ってみてください

6. コードをテストする
    - ```docker-compose up```
    - postmanやcurl等でPOSTやDELETEを試してみてください  
    POSTの例
      - ```curl -H 'Content-Type: Application/json' -XPOST http://localhost/api/v1/messages/4 -d '{"message":"wahhooooi!"}'```
      - ```curl http://localhost/api/v1/messages/4```

7. コンテナを終了する
    - ```docker-compose down```