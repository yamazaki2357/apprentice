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

### 指定しているデータベースの確認
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
```DESCRIBE users;```

### カラムの削除
```ALTER TABLE table_name DROP COLUMN column_name;```

</p>
</details>

<details>
<summary>データの登録・検索・更新・削除</summary>
<p>

### データの登録
```INSERT INTO users (username, email, age, gender, hometown) VALUES('JohnDoe', 'hoge@example.com', 30, 'male', 'New York');```

### データの検索
```SELECT * FROM users;```

### データの更新
```UPDATE users SET age = 35 WHERE username = 'John';```

### データの削除
```DELETE FROM users;```

</p>
</details>

<details>
<summary>データの検索</summary>
<p>

### 全カラムの取得
```SELECT * FROM dept_manager;```

### カラムの選択
```SELECT emp_no FROM dept_manager;```

### カラム名の別名
```SELECT emp_no AS employee_no FROM dept_manager;```

### 重複行の削除
```SELECT DISTINCT dept_no FROM dept_manager;```

</p>
</details>

<details>
<summary>データの絞り込み</summary>
<p>

### 指定した行数のみ取得
```SELECT * FROM employees LIMIT 10;```

### 等しいデータの絞り込み
```SELECT * FROM employees WHERE gender = 'F' LIMIT 10;```

### 等しくないデータの絞り込み
```SELECT * FROM employees WHERE gender != 'F' LIMIT 10;```

### より大きいデータの絞り込み
```SELECT * FROM employees WHERE birth_date > '1960-01-01' LIMIT 10;```

### あいまいな条件の絞り込み
 ```SELECT * FROM employees WHERE first_name LIKE '%vi%' LIMIT 10;```

### 特定の範囲の絞り込み
```SELECT * FROM employees WHERE birth_date BETWEEN '1960-01-01' AND '1960-01-31' LIMIT 10;```

### かつ
```SELECT * FROM employees WHERE first_name = 'Mary' AND gender = 'F';```

### または
``` SELECT * FROM employees WHERE first_name = 'Mary' OR last_name = 'Peck' LIMIT 10;```

### 含まれる
```SELECT * FROM employees WHERE emp_no IN (10011, 10021, 10031);```

### 従業員番号
```SELECT first_name, last_name FROM employees WHERE emp_no = 20000;```

### 誕生日
```SELECT * FROM employees WHERE birth_date LIKE '1959-01-%';```

</p>
</details>


<details>
<summary>検索結果の並び替え</summary>
<p>

### 昇順の並び替え
```SELECT * FROM employees ORDER BY birth_date ASC LIMIT 10;```

### 降順の並び替え
```SELECT * FROM employees ORDER BY birth_date DESC LIMIT 10;```

### 複数条件の並び替え
```SELECT * FROM employees ORDER BY birth_date DESC, hire_date DESC LIMIT 30;```

</p>
</details>