# Tệp CMakeLists cho src
add_subdirectory(Domain)
add_subdirectory(Application)
add_subdirectory(Infrastructure)
add_subdirectory(Presentation)
add_subdirectory(SharedKernel)

# Tìm kiếm libpq
find_library(LIBPQ pq REQUIRED)

# Thêm libpq vào dự án
target_link_libraries(Infrastructure
        PUBLIC
        ${LIBPQ}
)
