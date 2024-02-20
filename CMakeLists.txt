cmake_minimum_required(VERSION 3.23)

project(iowkit VERSION 1.7 LANGUAGES C CXX)

include(cmake/CPM.cmake)

CPMAddPackage(
        NAME io_warrior_linux
        VERSION 1.7.0
        GIT_REPOSITORY "https://github.com/codemercs-com/io-warrior-linux"
        GIT_TAG "de9019b"
        DOWNLOAD_ONLY
)

add_library(iowkit SHARED)
target_include_directories(iowkit PUBLIC
        $<BUILD_INTERFACE:${io_warrior_linux_SOURCE_DIR}/api/libiowkit-1.7.0/src/>
)
target_sources(iowkit PRIVATE
        ${io_warrior_linux_SOURCE_DIR}/api/libiowkit-1.7.0/src/iowkit.c
)
target_sources(iowkit PUBLIC FILE_SET hs TYPE HEADERS
    BASE_DIRS
        ${io_warrior_linux_SOURCE_DIR}/api/libiowkit-1.7.0/src/
    FILES
        ${io_warrior_linux_SOURCE_DIR}/api/libiowkit-1.7.0/src/iowarrior.h
        ${io_warrior_linux_SOURCE_DIR}/api/libiowkit-1.7.0/src/iowkit.h
)

include(cmake/packaging.cmake)
