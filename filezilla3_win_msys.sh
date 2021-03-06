#!/bin/sh
# export FZ3_LIBS_DIR=/c/the/directory/you/wanna/install/filezilla3
if [ -z "$FZ3_LIBS_DIR" ] ; then
	
	# update & install require packages
	pacman -Syu --noconfirm
	pacman -S autoconf automake libtool make mingw-w64-i686-toolchain mingw-w64-x86_64-toolchain git svn

	# Fix missing platform prefix for windres
	[ -f /mingw64/bin/x86_64-w64-mingw32-windres.exe ] || ln -s /mingw64/bin/windres.exe /mingw64/bin/x86_64-w64-mingw32-windres.exe
	[ -f /mingw32/bin/i686-w64-mingw32-windres.exe  ] || ln -s /mingw32/bin/windres.exe /mingw32/bin/i686-w64-mingw32-windres.exe

	# mkdir
	mkdir $FZ3_LIBS_DIR/prefix
	echo 'export PATH="$FZ3_LIBS_DIR/prefix/bin:/mingw64/bin:/mingw32/bin:$PATH"' >> ~/.profile
	echo 'export PKG_CONFIG_PATH="$FZ3_LIBS_DIR/prefix/lib/pkgconfig"' >> ~/.profile
	echo 'export PATH="$FZ3_LIBS_DIR/prefix/bin:/mingw64/bin:/mingw32/bin:$PATH"' >> ~/.bash_profile
	echo 'export PKG_CONFIG_PATH="$FZ3_LIBS_DIR/prefix/lib/pkgconfig"' >> ~/.bash_profile
	source ~/.profile

	#build gmp
	cd $FZ3_LIBS_DIR
	curl -O https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz
	tar xf gmp-6.1.2.tar.xz
	cd gmp-6.1.2
	./configure --build=x86_64-w64-mingw32 --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static --enable-fat
	make && make install

	#build nettle
	cd $FZ3_LIBS_DIR
	wget https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz
	tar xf nettle-3.4.tar.gz
	cd nettle-3.4
	./configure --build=x86_64-w64-mingw32 --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static --enable-fat
	make && make install

	#build zlib
	cd $FZ3_LIBS_DIR
	wget https://zlib.net/zlib-1.2.11.tar.gz
	tar xf zlib-1.2.11.tar.gz
	cd zlib-1.2.11
	LDSHAREDLIBC= ./configure --prefix="$FZ3_LIBS_DIR/prefix" -u=GNU
	make && make install

	#build gnuTLS
	cd $FZ3_LIBS_DIR
	wget ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.19.tar.xz
	tar xf gnutls-3.5.19.tar.xz
	cd gnutls-3.5.19
	./configure --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static --build=x86_64-w64-mingw32 --with-included-libtasn1 --disable-doc --disable-guile --without-p11-kit --enable-local-libopts --disable-nls --with-included-unistring --disable-tests
	make && make install

	#build sqlite
	cd $FZ3_LIBS_DIR
	wget https://sqlite.org/2018/sqlite-autoconf-3250300.tar.gz
	tar xf sqlite-autoconf-3250300.tar.gz
	cd sqlite-autoconf-3250300
	./configure --build=x86_64-w64-mingw32 --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static
	make && make install

	#build wxwidgets
	cd $FZ3_LIBS_DIR
	git clone --branch WX_3_0_BRANCH --single-branch https://github.com/wxWidgets/wxWidgets.git wx3
	cd wx3
	./configure --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static --enable-unicode --without-libtiff --without-libjpeg --with-expat=builtin --with-libpng=builtin
	make && make install

	#build libfilezilla
	cd $FZ3_LIBS_DIR
	svn co https://svn.filezilla-project.org/svn/libfilezilla/trunk libfilezilla
	cd libfilezilla
	autoreconf -i 
	./configure --prefix="$FZ3_LIBS_DIR/prefix" --enable-shared --disable-static
	make && make install

	#build filezilla3
	cd $FZ3_LIBS_DIR
	svn co https://svn.filezilla-project.org/svn/FileZilla3/trunk filezilla
	cd $FZ3_LIBS_DIR/filezilla
	autoreconf -i
	./configure --with-pugixml=builtin
	make

	#strip src/interface/.libs/filezilla.exe
	#strip src/putty/.libs/fzsftp.exe
	#strip src/putty/.libs/fzputtygen.exe
	#strip src/fzshellext/64/.libs/libfzshellext-0.dll
	#strip src/fzshellext/32/.libs/libfzshellext-0.dll
	#strip data/dlls/*.dll
else
	echo "Are you export $FZ3_LIBS_DIR?"
fi
