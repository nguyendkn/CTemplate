# Tạo thư viện Infrastructure
add_library(Infrastructure STATIC)

# Thêm source file
target_sources(Infrastructure
        PRIVATE
        Persistence/DeviceRepository.cpp
        Persistence/UserRepository.cpp
        Persistence/WalletRepository.cpp
        PUBLIC
        Persistence/DeviceRepository.h
        Persistence/UserRepository.h
        Persistence/WalletRepository.h
)

# Link với Domain layer
target_link_libraries(Infrastructure
        PUBLIC
        Domain
)

# Thêm include directory
target_include_directories(Infrastructure
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)
