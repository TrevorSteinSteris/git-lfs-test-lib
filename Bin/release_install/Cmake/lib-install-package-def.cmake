include(${LIB_SUBMODULE_CMAKE_DIR}/LibList.cmake)
add_library(${TEST_LIB_NAME} SHARED IMPORTED)
set_target_properties(${TEST_LIB_NAME} PROPERTIES
  IMPORTED_LOCATION "${CMAKE_CURRENT_LIST_DIR}/../install/lib/lib${TEST_LIB_NAME}.so"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/../install/include")
install(DIRECTORY "${CMAKE_CURRENT_LIST_DIR}/../install/include/" DESTINATION ${APP_INSTALL_DIR}${PROJECT_INCLUDE_DIR})