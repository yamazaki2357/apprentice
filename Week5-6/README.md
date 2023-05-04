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

