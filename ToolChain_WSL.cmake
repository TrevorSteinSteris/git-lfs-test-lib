set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

#set(SDK_ROOT "/mnt/f/Builds/sdk/imx-sdk-steris")
#set(HOST_SYSROOT "${SDK_ROOT}/sysroots/cortexa9hf-neon-poky-linux-gnueabi")
#message("Sysroot ${CMAKE_SYSROOT}")
#message("TOOLCHAIN_PATH ${TOOLCHAIN_PATH}")

#set(CMAKE_SYSROOT ${HOST_SYSROOT})
set(CMAKE_FIND_ROOT_PATH  "${CMAKE_SYSROOT}")
set(CMAKE_PREFIX_PATH ${CMAKE_SYSROOT})
set(CMAKE_STAGING_PREFIX . )

set(TOOLCHAIN_ARCH "arm-poky-linux-gnueabi")
#set(TOOLCHAIN_PATH "${SDK_ROOT}/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi")

set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/${TOOLCHAIN_ARCH}-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/${TOOLCHAIN_ARCH}-g++")

#Flags definitions
set(BASE_COMPILE_FLAGS "-mthumb -mfpu=neon -mfloat-abi=hard -mcpu=cortex-a9 -fstack-protector-strong   -Wformat -Wformat-security -Werror=format-security --sysroot=${CMAKE_SYSROOT}")

if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(BASE_COMPILE_FLAGS "${BASE_COMPILE_FLAGS} -D_FORTIFY_SOURCE=2")
endif()
set(CMAKE_C_FLAGS "${BASE_COMPILE_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${BASE_COMPILE_FLAGS}" CACHE STRING "" FORCE)
#message("Base CXX Compile flags ${CMAKE_CXX_FLAGS}")

set(CMAKE_EXE_LINKER_FLAGS  "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now --sysroot=${CMAKE_SYSROOT}" CACHE STRING "" FORCE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)