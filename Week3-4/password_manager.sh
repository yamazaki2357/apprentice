#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
  read choice

  if [ "$choice" = "Add Password" ]; then
    echo "サービス名を入力してください："
    read service
    echo "ユーザー名を入力してください："
    read username
    echo "パスワードを入力してください："
    read password

    echo "$service $username $password" >> password.txt
    echo "パスワードの追加は成功しました。"

  elif [ "$choice" = "Get Password" ]; then
    while true; do
      echo "サービス名を入力してください："
      read service
      result=$(grep $service password.txt)
    
      if [[ -z "$result" ]]; then
        echo "そのサービスは登録されていません。"
      else
        echo "サービス名：$(echo $result | cut -d " " -f 1)"
        echo "ユーザー名：$(echo $result | cut -d " " -f 2)"
        echo "パスワード：$(echo $result | cut -d " " -f 3)"
        break
      fi

      echo "他のサービス名で検索しますか？ (Y/N)"
      read continue_search

      if [ "$continue_search" != "Y" ]; then
        break
      fi
    done

  elif [ "$choice" = "Exit" ]; then
    echo "Thank you!"
    break
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
