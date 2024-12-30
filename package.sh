#!/bin/bash

# Script để cài đặt các package cần thiết cho dự án C++

# Kiểm tra quyền root
if [ "$(uname)" != "Darwin" ] && [ "$(id -u)" -ne 0 ]; then
    echo "Vui lòng chạy script với quyền root hoặc sử dụng sudo trên hệ điều hành Linux."
    exit 1
fi

# Cập nhật package manager
echo "Cập nhật package manager..."
if [ "$(uname)" == "Darwin" ]; then
    # macOS
    brew update
elif [ -f "/etc/debian_version" ]; then
    # Ubuntu/Debian
    sudo apt update && sudo apt upgrade -y
elif [ -f "/etc/redhat-release" ]; then
    # CentOS/Fedora
    sudo yum update -y
else
    echo "Hệ điều hành không được hỗ trợ."
    exit 1
fi

# Cài đặt PostgreSQL và libpq
echo "Cài đặt PostgreSQL và libpq..."
if [ "$(uname)" == "Darwin" ]; then
    brew install postgresql libpq
    echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
elif [ -f "/etc/debian_version" ]; then
    sudo apt install -y postgresql postgresql-contrib libpq-dev
elif [ -f "/etc/redhat-release" ]; then
    sudo yum install -y postgresql postgresql-server libpq-devel
fi

# Cài đặt CMake
echo "Cài đặt CMake..."
if [ "$(uname)" == "Darwin" ]; then
    brew install cmake
elif [ -f "/etc/debian_version" ]; then
    sudo apt install -y cmake
elif [ -f "/etc/redhat-release" ]; then
    sudo yum install -y cmake
fi

# Cài đặt công cụ build
echo "Cài đặt công cụ build (gcc, clang, make)..."
if [ "$(uname)" == "Darwin" ]; then
    brew install gcc make clang
elif [ -f "/etc/debian_version" ]; then
    sudo apt install -y build-essential clang
elif [ -f "/etc/redhat-release" ]; then
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y clang
fi

# Khởi động service PostgreSQL
echo "Khởi động PostgreSQL..."
if [ "$(uname)" == "Darwin" ]; then
    brew services start postgresql
elif [ -f "/etc/debian_version" ]; then
    service postgresql start
elif [ -f "/etc/redhat-release" ]; then
    systemctl start postgresql
fi

# Tạo cơ sở dữ liệu mẫu
echo "Tạo cơ sở dữ liệu mẫu..."
if [ "$(uname)" == "Darwin" ]; then
    brew services start postgresql
    createdb $(whoami)
else
    sudo service postgresql start
    sudo -u postgres psql -c "CREATE DATABASE CTemplate;"
fi

echo "Cài đặt hoàn tất. Các package cần thiết đã được cài đặt thành công!"
