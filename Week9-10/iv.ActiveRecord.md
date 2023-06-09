**ActiveRecordとは**

ActiveRecordはRuby on Railsの主要なコンポーネントで、データベースとのやり取りを抽象化し、Rubyのオブジェクトとしてデータベースのレコードを扱うことを可能にします。これはObject-Relational Mapping (ORM)と呼ばれる技術の一種で、オブジェクト指向プログラミングとリレーショナルデータベースの間のギャップを埋めます。

**ActiveRecordのメリット**

1. **データベースの抽象化：** ActiveRecordはデータベースの詳細を抽象化します。つまり、データベースの種類（MySQL、PostgreSQLなど）に関係なく、同じRubyのコードでデータベース操作を行うことができます。

2. **直感的なAPI：** ActiveRecordは直感的なAPIを提供します。例えば、データベースのレコードはRubyのオブジェクトとして扱われ、レコードの作成、読み取り、更新、削除（CRUD操作）はメソッド呼び出しとして表現されます。

3. **マイグレーション：** ActiveRecordはデータベースのスキーマを管理するためのマイグレーションシステムを提供します。これにより、データベースの変更をバージョン管理し、共有することが容易になります。

**Active Recordパターンとは**

Active Recordパターンは、オブジェクトがそのデータと振る舞いをカプセル化するオブジェクト指向プログラミングの原則を、データベースの世界に適用したものです。このパターンでは、データベースのテーブルはクラスとして表現され、テーブルの行（レコード）はそのクラスのインスタンスとして表現されます。そして、テーブルの列はインスタンスの属性として表現されます。

Active Recordパターンの主な特徴は、データベースのレコードが自身を読み書きする能力を持つことです。つまり、Active Recordオブジェクトは自身のデータをデータベースに保存し、データベースから読み込むことができます。これにより、データベース操作を直感的に行うことができます。


2. 全データの取得
```bash
Todo.all
```

3. SQLクエリの確認
```bash
Todo.all.to_sql
```

4. 特定のデータの取得
```bash
Todo.where("title LIKE ?", "%test%")
```

5. バリデーション
