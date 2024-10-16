#!/bin/bash

# 必要なパッケージのリスト
REQUIRED_PACKAGES=(
  "binutils"
  "bison"
  "make"
  "bzip2"
  "coreutils"
  "diffutils"
  "findutils"
  "gawk"
  "gcc"
  "gcc-c++"
  "glibc-devel"
  "grep"
  "gzip"
  "kernel-headers"
  "m4"
  "patch"
  "perl"
  "python3"
  "sed"
  "tar"
  "texinfo"
  "xz"
)

# 必要なパッケージがすでにインストールされているかチェックし、インストールされていなければインストール
for package in "${REQUIRED_PACKAGES[@]}"; do
  if rpm -q $package >/dev/null 2>&1; then
    echo "$package is already installed!"
  else
    echo "$package is installing..."
    sudo dnf install -y $package
  fi
done

echo "Done"
