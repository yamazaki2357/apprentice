# パスワードマネージャー

## 環境の準備
```bash
# dockerを起動
docker compose up -d
# dockerの中に入る
docker compose exec app bash
```

## 実行準備
```bash
# startup.shに実行権限を付与
chmod +x startup.sh

# startup.shを実行して公開鍵と秘密鍵を読み込む
./startup.sh
```

## 実行
```bash
./password_manager.sh
```

**password.gpgの内容確認**
```bash
# password.gpgを復号化して標準出力に出力
gpg --decrypt password.gpg | cat
```

```bash
# 作業後
# dockerの中から出る
exit
# dockerを停止
docker compose down
```