## ファイルを操作できる
### シンボリックリンク
```ln -s README.md README_SYMBOLIC.md```

### ファイルの検索
```find -type f -name "*README*"```

### 検索
```grep -E ^a sample.txt```

## 標準入力を扱える
### 出力とエラー出力のリダイレクト
```ls / /hoge　> ~/result.txt 2>&1```

### パイプライン
```ls | grep -E ^l```
