# Tạo thư viện Application
add_library(Application STATIC)

# Thêm source file
target_sources(Application
        PRIVATE
        Services/DeviceService.cpp
        Services/UserService.cpp
        Services/WalletService.cpp
        PUBLIC
        Services/DeviceService.h
        Services/UserService.h
        Services/WalletService.h
)

# Link với Domain layer
target_link_libraries(Application
        PUBLIC
        Domain
)

# Thêm include directory
target_include_directories(Application
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)
