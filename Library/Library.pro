TARGET = GildedRose
TEMPLATE = lib
CONFIG += staticlib c++11
CONFIG -= qt

SOURCES += GildedRose.cc
HEADERS += GildedRose.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
