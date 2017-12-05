TARGET = googletest
TEMPLATE = lib
CONFIG += staticlib c++11
CONFIG -= qt

DEFINES += SRCDIR=\\\"$$PWD/\\\" GTEST_LANG_CXX11
INCLUDEPATH += googletest/googletest googletest/googletest/include

SOURCES += \
    googletest/googletest/src/gtest-all.cc \
    googletest/googletest/src/gtest_main.cc \
