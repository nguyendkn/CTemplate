# Yêu cầu phiên bản tối thiểu của CMake
cmake_minimum_required(VERSION 3.20)

# Đặt tên cho dự án
project(CTemplate)

# Sử dụng chuẩn C++17 hoặc C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Tùy chọn build (debug/release)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# Bật chế độ build toàn bộ warnings
if(MSVC)
    add_compile_options(/W4 /permissive-)
else()
    add_compile_options(-Wall -Wextra -pedantic -Werror)
endif()

# Thêm thư mục con cho dự án
add_subdirectory(src)    # Tất cả các source code
#add_subdirectory(tests)  # Unit và integration tests (bật lại nếu cần)

# Tùy chọn thêm
message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
