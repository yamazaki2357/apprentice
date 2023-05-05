# インターネットTV

## ステップ1：テーブル設計

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

## ステップ2：テーブルを構築し、データを入れる手順

<details>
<summary>1. mysqlの中に入る</summary>
<p>

Dockerを起動する
```docker compose up -d```

Dockerコンテナの中に入る  
```docker compose exec mysql bash```

mysqlの中に入る  
```mysql -u myuser -p```

</p>
</details>

<details>
<summary>2. データベースを作成する</summary>
<p>

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

</p>
</details>

<details>
<summary>3. テーブルを作成する</summary>
<p>

テーブルの作成  
(CREATE TABLE文ごとにコピペして実行する。この例では7回)
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
作成されたかどうか確認する  
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

</p>
</details>

<details>
<summary>4. テーブルにデータを入れる</summary>
<p>

テーブルごと.sqlファイルを作成し、データを入れる  
（.sqlファイルと同じディレクトリで実行する）

mysqlの外から実行  
```mysql -u myuser -p internet_tv < channel_table.sql ```  
mysqlの中から実行  
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
|          2 | NHK教育            |
|          1 | NHK総合            |
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

外部キー制約でデータが入力できない場合は一時的に外部キー制約を無効化して実行する。  
データを入力した後に、再度外部キー制約を有効化することを忘れずに行う。  
無効化  
```SET FOREIGN_KEY_CHECKS=0;```  
有効化  
```SET FOREIGN_KEY_CHECKS=1;```  

外部キー制約の確認  
```sql
mysql> SHOW VARIABLES LIKE 'FOREIGN_KEY_CHECKS';
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| foreign_key_checks | ON    |
+--------------------+-------+
1 row in set (0.03 sec)
```

</p>
</details>

## ステップ3:データを抽出するクエリ

<details>
<summary>1. エピソード視聴数トップ3のエピソードタイトルと視聴数を取得する</summary>
<p>

```sql
SELECT episode_title, views 
FROM episode_table 
ORDER BY views DESC 
LIMIT 3;
```

</p>
</details>

<details>
<summary>2. エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得する</summary>
<p>

```sql
SELECT program_title, season_number, episode_number, episode_title, views
FROM episode_table
INNER JOIN season_table
ON episode_table.season_id = season_table.season_id
INNER JOIN program_table
ON episode_table.program_id = program_table.program_id
ORDER BY views DESC
LIMIT 3;
```

</p>
</details>

<details>
<summary>3. 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得する。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします</summary>
<p>

```sql
SELECT
  channel_table.channel_name,
  CONCAT(CURDATE(), ' ', time_slot_table.start_time) AS broadcast_start_time,
  time_slot_table.end_time AS broadcast_end_time,
  season_table.season_number,
  episode_table.episode_number,
  episode_table.episode_title,
  episode_table.episode_description
FROM time_slot_table
JOIN channel_table 
ON time_slot_table.channel_id = channel_table.channel_id
JOIN episode_table 
ON time_slot_table.start_time >= CURDATE() AND time_slot_table.start_time < DATE_ADD(CURDATE(), INTERVAL 1 DAY)
JOIN program_table 
ON episode_table.program_id = program_table.program_id
LEFT JOIN season_table 
ON episode_table.season_id = season_table.season_id
WHERE DATE(episode_table.release_date) = CURDATE()
ORDER BY channel_table.channel_name, time_slot_table.start_time;
```

</p>
</details>

<details>
<summary>4. ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得する</summary>
<p>

```sql
SELECT
  channel_table.channel_name,
  CONCAT(DATE(episode_table.release_date), ' ', time_slot_table.start_time) AS broadcast_start_time,
  CONCAT(DATE(episode_table.release_date), ' ', time_slot_table.end_time) AS broadcast_end_time,
  season_table.season_number,
  episode_table.episode_number,
  episode_table.episode_title,
  episode_table.episode_description
FROM time_slot_table
JOIN channel_table 
ON time_slot_table.channel_id = channel_table.channel_id
JOIN episode_table ON time_slot_table.start_time >= CURDATE() AND time_slot_table.start_time < DATE_ADD(CURDATE(), INTERVAL 1 WEEK)
JOIN program_table ON episode_table.program_id = program_table.program_id
LEFT JOIN season_table ON episode_table.season_id = season_table.season_id
WHERE channel_table.channel_name = 'ドラマ'
  AND DATE(episode_table.release_date) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 WEEK)
ORDER BY episode_table.release_date, time_slot_table.start_time;
```

</p>
</details>
