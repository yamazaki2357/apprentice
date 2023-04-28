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

### MySQLにmyuserユーザーでログイン
```mysql -u myuser -p```

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

<details>
<summary>ユーザーの作成、表示、権限付与、権限適用、権限確認</summary>
<p>

### ユーザーの作成
```CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';```

### ユーザーの表示
```SELECT USER, HOST FROM mysql.user;```

### ユーザーに権限を付与
```GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'localhost';```

### 権限のリロード
```FLUSH PRIVILEGES;```

### ユーザー権限の確認
```SHOW GRANTS FOR 'myuser'@'localhost';```

### ユーザーの削除
```DROP USER 'myuser'@'localhost';```

</p>
</details>

<details>
<summary>テーブルの作成、表示、削除、カラムの追加、表示、削除</summary>
<p>

### 指定しているデータベースの確認SHOs
```SELECT DATABASE();```

### テーブルの作成
```sql
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    hometown VARCHAR(100) NOT NULL,
    PRIMARY KEY (username)
);
```
### テーブルの表示
```SHOW TABLES;```

### テーブルの削除
```DROP TABLE table_name;```

### カラムの追加
```ALTER TABLE table_name ADD COLUMN column_name datatype;```

### カラムの表示
```DESCRIBE table_name;```

### カラムの削除
```ALTER TABLE table_name DROP COLUMN column_name;```

</p>
</details>