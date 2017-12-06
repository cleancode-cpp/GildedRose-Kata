cmake_minimum_required(VERSION 3.0.2)
project(GildedRose)

set (CMAKE_CXX_STANDARD 11)
set (gtest_force_shared_crt ON CACHE BOOL "MSVC defaults to shared CRT" FORCE)

add_subdirectory(thirdparty/googletest/googletest)
target_compile_definitions(gtest PUBLIC GTEST_LANG_CXX11 GTEST_HAS_TR1_TUPLE=0)

# domain library
add_library(gildedrose "" GildedRose.cc)
set_target_properties(gildedrose PROPERTIES COMPILE_FLAGS "${cxx_strict}")

# text tests
add_executable(gildedrose_app GildedRoseTextTests.cc)
set_target_properties(gildedrose_app PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(gildedrose_app gildedrose)

# unit tests
add_executable(gildedrose_tests GildedRoseUnitTests.cc)
set_target_properties(gildedrose_tests PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(gildedrose_tests gildedrose gtest gtest_main)
add_test(gildedrose_tests gildedrose_tests)
