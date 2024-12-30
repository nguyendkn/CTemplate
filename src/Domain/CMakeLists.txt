# Tạo thư viện Domain
add_library(Domain STATIC)

# Thêm source file
target_sources(Domain
        PRIVATE
        Entities/Device.cpp
        Entities/User.cpp
        Entities/Wallet.cpp

        ValueObjects/Address.cpp
        PUBLIC
        Entities/Device.h
        Entities/User.h
        Entities/Wallet.h

        Repositories/IDeviceRepository.h
        Repositories/IUserRepository.h
        Repositories/IWalletRepository.h

        ValueObjects/Address.h
)

# Thêm include directory
target_include_directories(Domain
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)
