# mingw64.exe
pacman -Syuu
pacman -S git base-devel mingw-w64-x86_64-toolchain python python-pip

# ここでシェル再起動
pacman -S mingw-w64-x86_64-python mingw-w64-x86_64-python-pip mingw-w64-x86_64-glib2 mingw-w64-x86_64-pixman

# 管理者権限をとってシンボリックリンク作成を許可すること

pushd /c/msys64/mingw64/bin
cp ar.exe x86_64-w64-mingw32-ar.exe
cp ranlib.exe x86_64-w64-mingw32-ranlib.exe
cp windres.exe x86_64-w64-mingw32-windres.exe
cp nm.exe x86_64-w64-mingw32-nm.exe
cp objcopy.exe x86_64-w64-mingw32-objcopy.exe
popd

git clone https://github.com/qemu/qemu
cd qemu
mkdir -p bin/debug/native
cd bin/debug/native
 ../../../configure --enable-debug --enable-trace-backend=simple --cross-prefix=x86_64-w64-mingw32-
