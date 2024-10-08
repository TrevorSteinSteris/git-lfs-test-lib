cmake_minimum_required(VERSION 3.16)
set(PROJ_NAME "git-lfs-test-lib")
project(${PROJ_NAME})
set(APP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/install/")
set(PROJECT_CMAKE_OUTPUT_DIR "${CMAKE_INSTALL_PREFIX}/Cmake" CACHE FILEPATH "docstring" FORCE)
set(PROJECT_INCLUDE_DIR include)
set(PROJECT_LIB_DIR lib)
set(GLOBAL_INSTALL_SYM_NAMELINK "" CACHE STRING "" )
set(CMAKE_BUILD_WITH_INSTALL_RPATH OFF)
set(LIBRARY_PERMISSIONS 
    OWNER_READ 
    OWNER_WRITE
    OWNER_EXECUTE
    GROUP_READ
    GROUP_EXECUTE
    WORLD_READ)

set(HEADER_FILE_PERMISSIONS
    OWNER_READ
    GROUP_READ
    WORLD_READ)
include(LibList.cmake)
install(FILES LibList.cmake lib-install-package-def.cmake
        DESTINATION ${PROJECT_CMAKE_OUTPUT_DIR})

# Test library compilation
add_library(${TEST_LIB_NAME} SHARED TestClass.cpp)
set_target_properties(${TEST_LIB_NAME} PROPERTIES VERSION "0.0.0" SOVERSION "0")
install(TARGETS ${TEST_LIB_NAME}
        LIBRARY DESTINATION ${APP_INSTALL_DIR}${PROJECT_LIB_DIR}
        PERMISSIONS ${LIBRARY_PERMISSIONS}
        PUBLIC_HEADER DESTINATION ${APP_INSTALL_DIR}${PROJECT_INCLUDE_DIR})
install(FILES TestClass.hpp
        DESTINATION ${APP_INSTALL_DIR}${PROJECT_INCLUDE_DIR}
        PERMISSIONS ${HEADER_FILE_PERMISSIONS})