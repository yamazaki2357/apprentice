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

<details>
<summary>データの集計</summary>
<p>

### 列の合計値
```SELECT SUM(salary) FROM salaries;```

### 列の平均値
```SELECT AVG(salary) FROM salaries;```

### 四捨五入
```SELECT ROUND(AVG(salary)) FROM salaries;```

### 列の最大値
```SELECT MAX(salary) FROM salaries;```

### 列の最小値
```SELECT MIN(salary) FROM salaries;```

### 行数
```SELECT COUNT(*) FROM salaries;```

### 絞り込みとの組み合わせ
```SELECT MAX(salary) FROM salaries WHERE from_date = '1986-06-26';```

### 少数第1桁
```SELECT ROUND(AVG(salary),1) FROM salaries WHERE to_date = '1991-06-26';```

</p>
</details>

<details>
<summary>データのグルーピング</summary>
<p>

### グルーピング
```sql
SELECT emp_no, COUNT(*)
FROM salaries
GROUP BY emp_no
LIMIT 10;
```

### グルーピングと集計関数
```sql
SELECT emp_no, MIN(salary), MAX(salary)
FROM salaries
WHERE emp_no BETWEEN 10001 AND 10010
GROUP BY emp_no
ORDER BY emp_no ASC;
```

### グルーピングと集計関数2
```sql
SELECT emp_no, MIN(from_date), MAX(to_date)
FROM salaries
WHERE emp_no BETWEEN 10001 AND 10010
GROUP BY emp_no;
```

### 絞り込み
```sql
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING MAX(salary) > 140000;
```

### 最小給与
```sql
SELECT emp_no, MIN(salary)
FROM salaries
WHERE emp_no BETWEEN 10001 AND 10100
GROUP BY emp_no
HAVING MIN(salary) < 40000;
```

### 最終勤務日
```sql
SELECT emp_no, MAX(to_date)
FROM salaries
WHERE emp_no BETWEEN 10001 AND 10100
GROUP BY emp_no
HAVING MAX(to_date) < '9999-01-01';
```

</p>
</details>

<details>
<summary>テーブルの結合</summary>
<p>

### 内部結合
```sql
SELECT *
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;
```

### 列の選択
```sql
SELECT dept_no, dept_manager.emp_no, first_name, last_name
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;
```

### 複数の内部結合
```sql
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, first_name, last_name
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no;
```

### 絞り込み
```sql
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, first_name, last_name
FROM dept_manager
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date = '9999-01-01';
```

### 給与
```sql
SELECT employees.emp_no, first_name, last_name, from_date, to_date, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE employees.emp_no BETWEEN 10001 AND 10010;
```

</p>
</details>

<details>
<summary>サブクエリ</summary>
<p>

### サブクエリ
```sql
SELECT emp_no, salary
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries)
AND emp_no BETWEEN 10001 AND 10010;
```

### 重複なし
```sql
SELECT DISTINCT emp_no
FROM salaries
WHERE salary > (SELECT AVG(salary) * 2 FROM salaries);
```

### 最大給与
```sql
SELECT emp_no, MAX(salary)
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries)
AND emp_no BETWEEN 10001 AND 10010
GROUP BY emp_no;
```

</p>
</details>

<details>
<summary>条件分岐</summary>
<p>

### CASE
```sql
SELECT emp_no, to_date,
CASE WHEN to_date = '9999-01-01' THEN 'employed'
ELSE 'unemployed'
END AS status
FROM dept_emp
WHERE emp_no BETWEEN 10100 AND 10200;
```

### 年代
```sql
SELECT emp_no, birth_date,
CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s'
WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s'
END AS decade
FROM employees
WHERE emp_no BETWEEN 10001 AND 10050;
```

### 年代ごとの最大給与
```sql
SELECT emp_no, birth_date,
CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '50s'
WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '60s'
END AS decade
FROM employees
WHERE emp_no BETWEEN 10001 AND 10050
GROUP BY emp_no;
```

</p>
</details>

<details>
<summary>テーブル</summary>

[label](http://www.plantuml.com/plantuml/png/SYWkIImgAStDuL9CIKtBp4jL24bCoadLo4lCJTL9IIrErbH8paaiBbO02IWa5YieWGIL56ni53H2T9JTt1o1G5F1pWwkFw0eCpUngD8xjLAZGbF19Za_9x_8gYWrnQx2HX_CGIXroozApKpFGrMQb5EQ2cYb_5KQ288mtkzJBDk9faXhPI62Y68VxBJr1SJYTZ519KQKYmasdY3Hd8H8WY86NsRSFVCMxZd9AZDSWc0JilFDVBzl_t2_UWNc6ISTsxi5KmKp0jC4aov9nOjgGHu8AHSbIkkhihAziUChfPB_mQ8zh-V_hzy-7vwok6iRBtu99lasIK5xmsCmZw1VnU4KR-EglOm8dXS37YM2noBYFzuJTpFw0O1ESoCz1DFrTeJ4LOuaFOHDL1-2RcvsWdaz1LklhFa8HUbGneGXZ1lSksQDq4EHur2Q-96h3-voqkQkxbnRXsLsykm64MMxrbasxFC4NE8voBRvOOGySNzSQ-IFejxoRo7FCFU8fTfIVbggJINvs_lR_8msmKzRgZ9EUeEYan1S8CDb7flJo01UvZzmbWk3GzIRNXFe2zlGsL47eZReKo5MzlPtyu_Z5m00)

<p>

テーブル：顧客テーブル（customers）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT |
|---------|-------------|------|-----------|--------|----------------|
| customer_id | BIGINT(20) |      | PRIMARY   |        | YES            |
| customer_name | VARCHAR(255) |      |           |        |                |
| phone_number | VARCHAR(20) |      |           |        |                |
| email | VARCHAR(255) |      |           |        |                |
 
テーブル：商品テーブル（items）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT |
|---------|-------------|------|-----------|--------|----------------|
| item_id | BIGINT(20) |      | PRIMARY   |        | YES            |
| item_name | VARCHAR(255) |      |           |        |                |
| price | INT |      |           |        |                |

テーブル：カテゴリーテーブル（categories）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT |
|---------|-------------|------|-----------|--------|----------------|
| category_id | BIGINT(20) |      | PRIMARY   |        | YES            |
| category_name | VARCHAR(255) |      |           |        |                |

テーブル：商品カテゴリーテーブル（item_categories）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT | 外部キー制約 |
|---------|-------------|------|-----------|--------|----------------|---------------|
| item_id | BIGINT(20) |      | PRIMARY   |        | YES            | 外部キー(item_id) 参照元：items(item_id) |
| category_id | BIGINT(20) |      | PRIMARY   |        | YES            | 外部キー(category_id) 参照元：categories(category_id) |

テーブル：注文テーブル（orders）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT | 外部キー制約 |
|---------|-------------|------|-----------|--------|----------------|---------------|
| order_id | BIGINT(20) |      | PRIMARY   |        | YES            |                |
| customer_id | BIGINT(20) |      |           |        |                | 外部キー(customer_id) 参照元：customers(customer_id) |
| order_date | DATETIME |      |           |        |                |
| order_status | VARCHAR(20) |      |           |        |                |

テーブル：注文明細テーブル（order_details）

| カラム名 | データ型    | NULL | キー      | 初期値 | AUTO_INCREMENT | 外部キー制約 |
|---------|-------------|------|-----------|--------|----------------|---------------|
| order_id | BIGINT(20) |      | PRIMARY   |        | YES            | 外部キー(order_id) 参照元：注文テーブル(orders) |
| item_id | BIGINT(20) |      | PRIMARY   |        | YES            | 外部キー(item_id) 参照元：商品テーブル(items) |
| quantity | INT |      |           |        |                | |
| unit_price | INT |      |           |        |                | |

</p>
</details>

<details>
<summary>インデックスを設定できる</summary>
<p>

### インデックス設定前
```sql
mysql> EXPLAIN ANALYZE SELECT * FROM employees WHERE birth_date = '1961-08-03';
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                                                                                                                    |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Filter: (employees.birth_date = DATE'1961-08-03')  (cost=29434.75 rows=29203) (actual time=11.506..89.033 rows=67 loops=1)
    -> Table scan on employees  (cost=29434.75 rows=292025) (actual time=0.109..73.749 rows=300024 loops=1)
 |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.09 sec)
```

### インデックスの作成
```sql
CREATE INDEX idx_birth_date ON employees (birth_date);
```
### インデックスの確認
```sql
mysql> SHOW INDEXES FROM employees;
+-----------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employees |          0 | PRIMARY        |            1 | emp_no      | A         |      292025 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| employees |          1 | idx_birth_date |            1 | birth_date  | A         |        4770 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.02 sec) 
```

### インデックス設定後
```sql
mysql> EXPLAIN ANALYZE SELECT * FROM employees WHERE birth_date = '1961-08-03';
+---------------------------------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                                           |
+---------------------------------------------------------------------------------------------------------------------------------------------------+
| -> Index lookup on employees using idx_birth_date (birth_date=DATE'1961-08-03')  (cost=23.45 rows=67) (actual time=2.969..2.996 rows=67 loops=1)
 |
+---------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)
```
### インデックスの削除
```sql
DROP INDEX idx_birth_date ON employees;
```

### ベストプラクティス
- 頻繁に検索されるカラムに対してインデックスを作成する
- 大きなテーブルに対しては、インデックスの種類を適切に選択する
- インデックスを適切にメンテナンスする
- インデックスを過剰に作成しない


</p>
</details>