
add_library(gilded_rose STATIC
    "GildedRose.cpp"
    "GildedRose.h"
)
target_include_directories(gilded_rose PUBLIC .)

# unit tests
add_executable(gilded_rose_tests
    "GildedRoseUnitTests.cpp"
)
target_link_libraries(gilded_rose_tests
    PRIVATE gtest_main gilded_rose
)
add_test(NAME gilded_rose COMMAND gilded_rose_tests)

# app
add_executable(gilded_rose_app
  "GildedRoseTextTests.cpp"
)
target_link_libraries(gilded_rose_app
  PRIVATE gilded_rose
)
