#!/bin/bash

# 要生成的密钥对数量
COUNT=20

OUTFILE="keys.txt"

# 清空文件
> "$OUTFILE"

for ((i=1;i<=COUNT;i++))
do
    priv=$(wg genkey)
    pub=$(echo "$priv" | wg pubkey)

    echo "$priv $pub" >> "$OUTFILE"
done

echo "Generated $COUNT WireGuard key pairs -> $OUTFILE"