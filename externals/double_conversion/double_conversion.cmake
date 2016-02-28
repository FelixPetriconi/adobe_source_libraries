include(ExternalProject)

ExternalProject_add(
  double-conversion
  URL https://github.com/google/double-conversion/archive/v1.1.5.tar.gz
  URL_MD5 f7c62594d7ecfbc4421da32bc341a919
  CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
)

ExternalProject_Get_Property(double-conversion INSTALL_DIR)

message(STATUS "INSTALL_DIR: ${INSTALL_DIR}")
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  set(double_conversion_LIBRARIES ${INSTALL_DIR}/lib/double-conversion.lib)
else ()
  set(double_conversion_LIBRARIES ${INSTALL_DIR}/lib/double-conversion.a)
endif ()

set(double_conversion_INCLUDE_DIRS ${INSTALL_DIR}/src)