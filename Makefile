#############################################################################
#    This file is part of wimaxcmgui.
#
#    Copyright (c) MD: Minhazul Haq Shawon, 2012
#
#    wimaxcmgui is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    wimaxcmgui is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with wimaxcmgui.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_WEBKIT -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++ -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtGui -I/usr/include/qt4 -I. -I. -I.
LINK          = g++
LFLAGS        = -Wl,-O1
LIBS          = $(SUBLIBS)  -L/usr/lib/i386-linux-gnu -lQtGui -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = main.cpp \
		mainwindow.cpp \
		threadcontrol.cpp \
		timeupdate.cpp moc_mainwindow.cpp \
		moc_threadcontrol.cpp \
		moc_timeupdate.cpp \
		qrc_wimaxcmguirc.cpp
OBJECTS       = main.o \
		mainwindow.o \
		threadcontrol.o \
		timeupdate.o \
		moc_mainwindow.o \
		moc_threadcontrol.o \
		moc_timeupdate.o \
		qrc_wimaxcmguirc.o
DIST          = /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		wimaxcmgui.pro
QMAKE_TARGET  = wimaxcmgui
DESTDIR       = 
TARGET        = wimaxcmgui

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): ui_mainwindow.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: wimaxcmgui.pro  /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		/usr/lib/i386-linux-gnu/libQtGui.prl \
		/usr/lib/i386-linux-gnu/libQtCore.prl
	$(QMAKE) -o Makefile wimaxcmgui.pro
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/common/gcc-base.conf:
/usr/share/qt4/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt4/mkspecs/common/g++-base.conf:
/usr/share/qt4/mkspecs/common/g++-unix.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_phonon.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
/usr/lib/i386-linux-gnu/libQtGui.prl:
/usr/lib/i386-linux-gnu/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -o Makefile wimaxcmgui.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/wimaxcmgui1.0.0 || $(MKDIR) .tmp/wimaxcmgui1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/wimaxcmgui1.0.0/ && $(COPY_FILE) --parents mainwindow.h threadcontrol.h timeupdate.h .tmp/wimaxcmgui1.0.0/ && $(COPY_FILE) --parents wimaxcmguirc.qrc .tmp/wimaxcmgui1.0.0/ && $(COPY_FILE) --parents main.cpp mainwindow.cpp threadcontrol.cpp timeupdate.cpp .tmp/wimaxcmgui1.0.0/ && $(COPY_FILE) --parents mainwindow.ui .tmp/wimaxcmgui1.0.0/ && (cd `dirname .tmp/wimaxcmgui1.0.0` && $(TAR) wimaxcmgui1.0.0.tar wimaxcmgui1.0.0 && $(COMPRESS) wimaxcmgui1.0.0.tar) && $(MOVE) `dirname .tmp/wimaxcmgui1.0.0`/wimaxcmgui1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/wimaxcmgui1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc_mainwindow.cpp moc_threadcontrol.cpp moc_timeupdate.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_mainwindow.cpp moc_threadcontrol.cpp moc_timeupdate.cpp
moc_mainwindow.cpp: timeupdate.h \
		threadcontrol.h \
		ui_mainwindow.h \
		mainwindow.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) mainwindow.h -o moc_mainwindow.cpp

moc_threadcontrol.cpp: threadcontrol.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) threadcontrol.h -o moc_threadcontrol.cpp

moc_timeupdate.cpp: timeupdate.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) timeupdate.h -o moc_timeupdate.cpp

compiler_rcc_make_all: qrc_wimaxcmguirc.cpp
compiler_rcc_clean:
	-$(DEL_FILE) qrc_wimaxcmguirc.cpp
qrc_wimaxcmguirc.cpp: wimaxcmguirc.qrc \
		images/ToolsIcon/console.png \
		images/TabIcons/tools.png \
		images/AboutIcons/mail.png \
		images/wimaxcmgui.png \
		images/StatusIcons/disconnect.png \
		images/TabIcons/about.png \
		images/TabIcons/status.png \
		images/StatusIcons/netdisabled.png \
		images/StatusIcons/net1.png \
		images/StatusIcons/net2.png \
		images/StatusIcons/net3.png \
		images/StatusIcons/net4.png \
		images/StatusIcons/net5.png \
		images/ToolsIcon/bin.png \
		images/AccountIcons/activate.png \
		images/ToolsIcon/manual.png \
		images/StatusIcons/connected.png \
		images/ToolsIcon/configure.png \
		images/AccountIcons/load.png \
		images/AccountIcons/remove.png \
		images/ToolsIcon/help.png \
		images/ToolsIcon/up.png \
		images/TabIcons/user.png \
		images/AccountIcons/save.png \
		images/StatusIcons/disconnected.png \
		images/StatusIcons/exit.png \
		images/AccountIcons/mac.png \
		images/StatusIcons/connect.png \
		images/AboutIcons/home.png \
		images/StatusIcons/nodevice.png
	/usr/bin/rcc -name wimaxcmguirc wimaxcmguirc.qrc -o qrc_wimaxcmguirc.cpp

compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_mainwindow.h
compiler_uic_clean:
	-$(DEL_FILE) ui_mainwindow.h
ui_mainwindow.h: mainwindow.ui
	/usr/bin/uic-qt4 mainwindow.ui -o ui_mainwindow.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean compiler_uic_clean 

####### Compile

main.o: main.cpp mainwindow.h \
		timeupdate.h \
		threadcontrol.h \
		ui_mainwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

mainwindow.o: mainwindow.cpp mainwindow.h \
		timeupdate.h \
		threadcontrol.h \
		ui_mainwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o mainwindow.o mainwindow.cpp

threadcontrol.o: threadcontrol.cpp threadcontrol.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o threadcontrol.o threadcontrol.cpp

timeupdate.o: timeupdate.cpp timeupdate.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o timeupdate.o timeupdate.cpp

moc_mainwindow.o: moc_mainwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_mainwindow.o moc_mainwindow.cpp

moc_threadcontrol.o: moc_threadcontrol.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_threadcontrol.o moc_threadcontrol.cpp

moc_timeupdate.o: moc_timeupdate.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_timeupdate.o moc_timeupdate.cpp

qrc_wimaxcmguirc.o: qrc_wimaxcmguirc.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qrc_wimaxcmguirc.o qrc_wimaxcmguirc.cpp

####### Install

install:
        cp wimaxcmgui /usr/bin -f

uninstall:
        rm /usr/bin/wimaxcmgui -f


