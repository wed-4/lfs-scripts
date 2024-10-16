#!/bin/bash

# エラーハンドリング
set -e
set -u

# LFS環境変数
LFS=/mnt/lfs  # LFSのマウントポイントを設定（必要に応じて変更）

# 必要なディレクトリの作成
echo "Creating necessary directories..."
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

# シンボリックリンクの作成
for i in bin lib sbin; do
  echo "Creating symlink for usr/$i..."
  ln -sv usr/$i $LFS/$i
done

# アーキテクチャに応じてlib64ディレクトリを作成
case $(uname -m) in
  x86_64)
    echo "Creating lib64 directory for x86_64 architecture..."
    mkdir -pv $LFS/lib64 ;;
esac

echo "Directory setup completed."
