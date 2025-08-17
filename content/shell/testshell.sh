#!/bin/sh

# 使用 /dev/urandom 生成随机数
rand() {
  # 取两个字节，转换成十进制
  od -An -N2 -tu2 /dev/urandom
}

max=$(rand)

n=1
while [ "$n" -le "$max" ]; do
  str=""

  if [ $((n % 3)) -eq 0 ]; then
    str="fizz"
  fi

  if [ $((n % 5)) -eq 0 ]; then
    str="${str}buzz"
  fi

  if [ -z "$str" ]; then
    str="$n"
  fi

  echo "$str"
  n=$((n + 1))
done
