# Tạo executable cho Presentation Layer
add_executable(Presentation)

# Thêm source file
target_sources(Presentation
        PRIVATE
        Controllers/DeviceController.cpp
        Controllers/UserController.cpp
        Controllers/WalletController.cpp
        ../main.cpp
)

# Link với Application layer
target_link_libraries(Presentation
        PUBLIC
        Application
        Infrastructure
)

# Thêm include directory
target_include_directories(Presentation
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)
