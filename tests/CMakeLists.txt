# Tạo thư viện Tests
add_executable(Tests)

# Thêm source file cho test
target_sources(Tests
        PRIVATE
        DomainTests/*.cpp
        ApplicationTests/*.cpp
)

# Link với các module cần test
target_link_libraries(Tests
        PRIVATE
        Domain
        Application
        Infrastructure
)

# Thêm include directory
target_include_directories(Tests
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)
