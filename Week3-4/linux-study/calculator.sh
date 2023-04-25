#!/bin/bash

echo "Enter two numbers:"
read num1
read num2
echo "Choose an arithmetic operation(+, -, *, /):"
read operation
case $operation in
    "+") echo "$num1 + $num2 = $((num1 + num2))";;
    "-") echo "$num1 - $num2 = $((num1 - num2))";;
    "*") echo "$num1 * $num2 = $((num1 * num2))";;
    "/") echo "$num1 / $num2 = $((num1 / num2))";;
    *) echo "Invalid operation"
esac

# for 文 または while 文を利用して、1~100までのうち、偶数の数字を表示する処理
# 以下の結果が出力されます。
# 2 4 8 ... 100

for i in {1..100}
do
  if [ $((i % 2)) -eq 0 ]; then
    echo -n "$i "
  fi
done

