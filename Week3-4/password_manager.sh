#!/bin/bash

echo "パスワードマネージャーへようこそ！"

#  ホスト側の環境変数をコンテナ側に渡す
PASSPHRASE=${PASSPHRASE_ENV_VAR}

while true; do
  echo "次の選択肢から入力してください([A]Add Password/[G]Get Password/[E]Exit):"
  read choice

  if [ "$choice" = "A" ]; then
    echo "サービス名を入力してください："
    read service
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    # password.gpgを復号化して、password.txtに出力
    gpg --trust-model always --batch --passphrase "$PASSPHRASE" --decrypt password.gpg > password.txt 2>/dev/null
    echo "$service:$username:$password" >> password.txt

    echo "パスワードの追加は成功しました。"
    # password.txtを暗号化して、password.gpgに上書き保存
    gpg --trust-model always --yes -r "yamazaki2357@gmail.com" -e -o password.gpg password.txt
    rm password.txt

  elif [ "$choice" = "G" ]; then
    while true; do
      echo "サービス名を入力してください："
      read service

      # password.gpgを復号化して、password.txtに出力
      gpg --trust-model always --batch --passphrase "$PASSPHRASE" --decrypt password.gpg > password.txt 2>/dev/null

      result=$(grep $service password.txt)

      if [[ -z "$result" ]]; then
        echo "そのサービスは登録されていません。"
      else
        echo "サービス名：$(echo $result | cut -d ":" -f 1)"
        echo "ユーザー名：$(echo $result | cut -d ":" -f 2)"
        echo "パスワード：$(echo $result | cut -d ":" -f 3)"
        break
      fi

      echo "他のサービス名で検索しますか？ (Y/N)"
      read continue_search

      if [ "$continue_search" != "Y" ]; then
        break
      fi
    done
    rm password.txt

  elif [ "$choice" = "E" ]; then
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。[A]Add Password/[G]Get Password/[E]Exit から入力してください。"
  fi
done
