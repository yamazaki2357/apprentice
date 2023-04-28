## Docker
---
### イメージのビルド
``` docker build -t mysql-image .```
### コンテナの作成と起動
``` docker run --name mysql-container -d -p 3306:3306 mysql-image```
### コンテナ内での操作
```docker exec -it mysql-container bash```
### コンテナ停止
```docker stop mysql-container```
### コンテナの再起動
```docker restart mysql-container```
### コンテナの削除
```docker rm mysql-container```

## MySQL
---
### MySQLにログイン
```mysql -u myuser -p```
### MySQLのバージョン確認
```SELECT VERSION();```
### MySQLのデータベース一覧確認
```SHOW DATABASES;```
### MySQLのデータベースの中身確認
```USE mydb;```
### MySQLのテーブル一覧確認
```SHOW TABLES;```
### MySQLのテーブルの中身確認
```SELECT * FROM mytable;```