#!/bin/bash

# 必要なパッケージのリスト
REQUIRED_PACKAGES=(
  "binutils"
  "bison"
  "build-essential"
  "bzip2"
  "coreutils"
  "diffutils"
  "findutils"
  "gawk"
  "gcc"
  "g++"
  "glibc-source"
  "grep"
  "gzip"
  "linux-headers-$(uname -r)"
  "m4"
  "make"
  "patch"
  "perl"
  "python3"
  "sed"
  "tar"
  "texinfo"
  "xz-utils"
)

# 必要なパッケージがすでにインストールされているかチェックし、インストールされていなければインストール
for package in "${REQUIRED_PACKAGES[@]}"; do
  if dpkg -s $package >/dev/null 2>&1; then
    echo "$package は既にインストールされています。"
  else
    echo "$package をインストール中..."
    sudo apt-get install -y $package
  fi
done

echo "すべてのパッケージがインストールされました。"
