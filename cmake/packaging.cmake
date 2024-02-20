include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(TARGETS iowkit EXPORT iowkitTargets FILE_SET hs)

write_basic_package_version_file(
        ${PROJECT_BINARY_DIR}/iowkit-config-version.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMinorVersion
)

install(FILES
        ${PROJECT_SOURCE_DIR}/cmake/iowkit-config.cmake
        ${PROJECT_BINARY_DIR}/iowkit-config-version.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/iowkit
)

install(EXPORT iowkitTargets
        NAMESPACE iowkit::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/iowkit
)

set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME "iowkit")
set(CPACK_PACKAGE_VENDOR "codemercs.com")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "kellermann@pm.me")

include(CPack)
