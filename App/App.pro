TARGET = GildedRoseTextTests
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += GildedRoseTextTests.cc

# depends "GildedRose" Library
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Library/release/ -lGildedRose
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Library/debug/ -lGildedRose
else:unix: LIBS += -L$$OUT_PWD/../Library/ -lGildedRose

INCLUDEPATH += $$PWD/../Library
DEPENDPATH += $$PWD/../Library

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/libGildedRose.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/libGildedRose.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/GildedRose.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/GildedRose.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../Library/libGildedRose.a
