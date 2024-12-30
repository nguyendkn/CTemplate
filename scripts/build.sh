#!/bin/bash

# Script để build dự án C++
# Build với cấu hình mặc định: ./scripts/build.sh
# Build với cấu hình Release: ./scripts/build.sh Release

# Đường dẫn thư mục gốc của dự án
PROJECT_ROOT=$(dirname "$(dirname "$(realpath "$0")")")

# Thư mục build
BUILD_DIR="$PROJECT_ROOT/build"

# Tùy chọn build type (Debug/Release)
BUILD_TYPE=${1:-Debug}

# Xóa thư mục build cũ nếu tồn tại
if [ -d "$BUILD_DIR" ]; then
    echo "Xóa thư mục build cũ..."
    rm -rf "$BUILD_DIR"
fi

# Tạo thư mục build mới
echo "Tạo thư mục build mới..."
mkdir -p "$BUILD_DIR"

# Di chuyển vào thư mục build
cd "$BUILD_DIR" || exit 1

# Chạy CMake để cấu hình dự án
echo "Cấu hình dự án với CMake (Build type: $BUILD_TYPE)..."
cmake -DCMAKE_BUILD_TYPE="$BUILD_TYPE" "$PROJECT_ROOT"

# Build dự án
echo "Build dự án..."
cmake --build .

# Kiểm tra nếu chương trình chính tồn tại
MAIN_EXECUTABLE="./src/Presentation/Presentation"
if [ -f "$MAIN_EXECUTABLE" ]; then
    echo "Chạy chương trình chính..."
    "$MAIN_EXECUTABLE"
else
    echo "Không tìm thấy chương trình chính ở $MAIN_EXECUTABLE. Kiểm tra lại quá trình build."
fi
