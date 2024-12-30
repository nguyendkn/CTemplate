# Tạo thư viện SharedKernel
add_library(SharedKernel STATIC
        Utilities/Logger.cpp
        Utilities/DateTime.cpp
)

# Thêm include directories để các module khác có thể sử dụng SharedKernel
target_include_directories(SharedKernel
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)

# Thiết lập compile options (tuỳ chọn, để thêm cảnh báo hoặc tối ưu hóa)
if(MSVC)
    target_compile_options(SharedKernel PRIVATE /W4 /WX)
else()
    target_compile_options(SharedKernel PRIVATE -Wall -Wextra -pedantic -Werror)
endif()

