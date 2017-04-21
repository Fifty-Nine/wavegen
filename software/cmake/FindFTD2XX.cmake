if (LIBFTD2XX_INCLUDE_DIR AND LIBD2XX_LIBRARIES)
  set (LIBFTD2XX_FOUND TRUE)
else ()
  find_path(LIBFTD2XX_INCLUDE_DIR ftd2xx.h)
  find_library(LIBFTD2XX_LIBRARIES NAMES ftd2xx)
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(
      LIBFTD2XX DEFAULT_MSG LIBFTD2XX_LIBRARIES LIBFTD2XX_INCLUDE_DIR
  )
endif()
