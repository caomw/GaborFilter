# Go ahead and use Qt.Core: it is about as platform-independent as
# the STL and Boost
QT += core

# Go ahead and use Qt.Gui: it is about as platform-independent as
# the STL and Boost. It is needed for QImage
QT += gui

# Don't define widgets: it would defy the purpose of this console
# application to work non-GUI
#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG   += console
CONFIG   -= app_bundle
TEMPLATE = app
SOURCES += main.cpp


include(../../Classes/CppAbout/CppAbout.pri)
include(../../Classes/CppGaborFilter/CppGaborFilter.pri)
include(../../Classes/CppGaborFilterWidget/CppGaborFilterWidget.pri)
include(../../Classes/CppHelp/CppHelp.pri)
include(../../Classes/CppMenuDialog/CppMenuDialog.pri)
include(../../Classes/CppRectangle/CppRectangle.pri)
include(../../Classes/CppRichelBilderbeekProgram/CppRichelBilderbeekProgram.pri)
include(../../Classes/CppTrace/CppTrace.pri)
include(../../Classes/CppWidget/CppWidget.pri)
include(../../Tools/ToolGaborFilter/ToolGaborFilterConsole.pri)

#
#
# Type of compile
#
#

CONFIG(release, debug|release) {
  DEFINES += NDEBUG NTRACE_BILDERBIKKEL
}

QMAKE_CXXFLAGS += -std=c++11 -Wall -Wextra -Weffc++

unix {
  QMAKE_CXXFLAGS += -Werror
}

#
#
# Boost
#
#

win32 {
  INCLUDEPATH += \
    ../../Libraries/boost_1_54_0
}

# Thanks to Qt
QMAKE_CXXFLAGS += -Wno-unused-variable

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov
