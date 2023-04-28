## Docker
<details>
<summary>イメージのビルド、作成と起動、コンテナ内での操作、停止、起動、削除</summary>
<p>

### イメージのビルド
``` docker build -t mysql-image .```
### コンテナの作成と起動
``` docker run --name mysql-container -d -p 3306:3306 mysql-image```
### コンテナ内での操作
```docker exec -it mysql-container bash```
### コンテナ停止
```docker stop mysql-container```
### コンテナの起動
```docker start mysql-container```
### コンテナの削除
```docker rm mysql-container```
</p>
</details>

## docker compose

### コンテナを起動する
```docker compose up -d```

### コンテナ内で操作する
```docker compose exec mysql bash```

### コンテナを停止する
```docker compose down```

## MySQL
### MySQLにrootユーザーでログイン
```mysql -u root -p```

<details>
<summary>データベースの作成、表示、指定、削除</summary>
<p>

### データベースの作成
```CREATE DATABASE database_name;```

### データベースの表示
```SHOW DATABASES;```

### データベースの指定
```USE database_name;```

### データベースの削除
```DROP DATABASE database_name;```

</p>
</details>