TEMPLATE = subdirs

SUBDIRS += \
    thirdparty \
    Library \
    App \
    UnitTests

App.depends = Library
UnitTests.depends = Library thirdparty
