# インターネットTV

## テーブル設計

<details>
<summary>テーブル設計</summary>
<p>

テーブル名: channel_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| channel_id | BIGINT(20) |  | PRIMARY |  | YES |
| channel_name | VARCHAR |  |  |  |  |

外部キー制約: なし  
ユニークキー制約: channel_name

テーブル名: time_slot_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| time_slot_id | BIGINT(20) |  | PRIMARY |  | YES |
| start_time | TIME |  |  |  |  |
| end_time | TIME |  |  |  |  |
| channel_id | BIGINT(20) |  | FOREIGN |  |  |

外部キー制約: channel_id -> channel_table.channel_id  
ユニークキー制約: channel_id, start_time

テーブル名: program_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| program_id | BIGINT(20) |  | PRIMARY |  | YES |
| program_title | VARCHAR |  |  |  |  |
| program_description | TEXT | YES |  |  |  |

外部キー制約: なし  
ユニークキー制約: program_title

テーブル名: season_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| season_id | BIGINT(20) |  | PRIMARY |  | YES |
| season_number | BIGINT(20) |  |  |  |  |
| program_id | BIGINT(20) |  | FOREIGN |  |  |

外部キー制約: program_id -> program_table.program_id  
ユニークキー制約: season_number, program_id

テーブル名: episode_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| episode_id | BIGINT(20) |  | PRIMARY |  | YES |
| episode_number | BIGINT(20) | YES |  |  |  |
| episode_title | VARCHAR |  |  |  |  |
| episode_description | TEXT | YES |  |  |  |
| video_length | TIME |  |  |  |  |
| release_date | DATE |  |  |  |  |
| views | BIGINT(20) |  |  | 0 |  |
| season_id | BIGINT(20) | YES | FOREIGN |  |  |
| program_id | BIGINT(20) |  | FOREIGN |  |  |

外部キー制約: season_id -> season_table.season_id, progrram_id -> program_table.program_id  
ユニークキー制約: episode_number, season_id(season_idがNULLでない場合）

テーブル名: genre_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| genre_id | BIGINT(20) |  | PRIMARY |  | YES |
| genre_name | VARCHAR |  |  |  |  |

外部キー制約: なし  
ユニークキー制約: genre_name

テーブル名: program_genre_table

| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| program_id | BIGINT(20) |  | PRIMARY |  |  |
| genre_id | BIGINT(20) |  | PRIMARY |  |  |

外部キー制約: program_id -> program_table.program_id, genre_id -> genre_table.genre_id  
ユニークキー制約: program_id, genre_id

</p>
</details>

Dockerを起動する
```docker compose up -d```

Dockerコンテナの中に入る  
```docker compose exec mysql bash```

mysqlの中に入る  
```mysql -u myuser -pmypassword```

データベースの表示  
```SHOW DATABASES;```

データベースの作成  
```CREATE DATABASE internet_tv;```

作成されたかどうか確認  
```SHOW DATABASES;```
```sql
+--------------------+
| Database           |
+--------------------+
| data_volume        |
| employees          |
| information_schema |
| internet_tv        |
| mysql              |
| performance_schema |
| sample_database    |
| sys                |
+--------------------+
8 rows in set (0.00 sec)
```

データベースの指定  
```USE internet_tv;```

指定しているデータベースの確認  
```SELECT DATABASE();```
```sql
+-------------+
| database()  |
+-------------+
| internet_tv |
+-------------+
1 row in set (0.00 sec)
```

テーブルの作成  
(CREATE TABLE文ごとにコピペ)
```sql
CREATE TABLE channel_table (
    channel_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    channel_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE time_slot_table (
    time_slot_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    start_time TIME,
    end_time TIME,
    channel_id BIGINT(20),
    FOREIGN KEY (channel_id) REFERENCES channel_table(channel_id),
    UNIQUE KEY (channel_id, start_time)
);

CREATE TABLE program_table (
    program_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    program_title VARCHAR(255) UNIQUE NOT NULL,
    program_description TEXT
);

CREATE TABLE season_table (
    season_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    season_number BIGINT(20),
    program_id BIGINT(20),
    FOREIGN KEY (program_id) REFERENCES program_table(program_id),
    UNIQUE KEY (season_number, program_id)
);

CREATE TABLE episode_table (
    episode_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    episode_number BIGINT(20),
    episode_title VARCHAR(255),
    episode_description TEXT,
    video_length TIME,
    release_date DATE,
    views BIGINT(20) DEFAULT 0,
    season_id BIGINT(20),
    program_id BIGINT(20),
    FOREIGN KEY (season_id) REFERENCES season_table(season_id),
    FOREIGN KEY (program_id) REFERENCES program_table(program_id),
    UNIQUE KEY (episode_number, season_id)
);

CREATE TABLE genre_table (
    genre_id BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE program_genre_table (
    program_id BIGINT(20),
    genre_id BIGINT(20),
    PRIMARY KEY (program_id, genre_id),
    FOREIGN KEY (program_id) REFERENCES program_table(program_id),
    FOREIGN KEY (genre_id) REFERENCES genre_table(genre_id)
);
```

作成されたかどうか確認  
```SHOW TABLES;```
```sql
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_internet_tv |
+-----------------------+
| channel_table         |
| episode_table         |
| genre_table           |
| program_genre_table   |
| program_table         |
| season_table          |
| time_slot_table       |
+-----------------------+
7 rows in set (0.01 sec)
```

データを入力する  
```mysql -u myuser -pmypassword internet_tv < channel_table.sql ```  
もしくは  
```source channel_table.sql```
```sql
source channel_table.sql
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0
```

データが入力されたか確認  
```SELECT * FROM channel_table;```
```sql
mysql> select * from channel_table;
+------------+-------------------+
| channel_id | channel_name      |
+------------+-------------------+
|          8 | BS11              |
|          2 | NHK教育           |
|          1 | NHK総合           |
|          5 | TBSテレビ          |
|          9 | WOWOWプライム      |
|         10 | スカパー！         |
|          4 | テレビ朝日         |
|          6 | テレビ東京         |
|          7 | フジテレビ         |
|          3 | 日本テレビ         |
+------------+-------------------+
10 rows in set (0.00 sec)
```

<!-- 外部キー制約を無効化してデータを入力した後に、再度外部キー制約を有効化することを忘れずに行う必要があります。 -->
<!-- 無効化 -->
<!-- SET FOREIGN_KEY_CHECKS=0; -->
<!-- 有効化 -->
<!-- SET FOREIGN_KEY_CHECKS=1; -->

```sql
mysql> SHOW VARIABLES LIKE 'FOREIGN_KEY_CHECKS';
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| foreign_key_checks | ON    |
+--------------------+-------+
1 row in set (0.03 sec)
```