#!/bin/bash

# 提醒用户更新Termux软件包
echo "更新Termux软件包..."
pkg update && pkg upgrade

# 更换软件源为清华大学镜像
echo "更换软件源为清华大学镜像..."
sed -i 's@^deb.*stable main$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
pkg update

# 添加TUR的软件仓库
echo "添加TUR的软件仓库..."
pkg install tur-repo

# 安装Python
echo "安装Python..."
pkg install python

# 安装NumPy
echo "安装NumPy..."
pkg install python-numpy

# 安装Pandas
echo "安装Pandas..."
pkg install python-pandas

# 安装Jupyter所需依赖
echo "安装Jupyter所需依赖..."
pkg install rust
pkg install binutils-is-llvm
cargo install maturin
pkg install -y libzmq libcrypt pkg-config
pip install clang
pip install ipython

# 安装特定版本的pyzmq以避免兼容性问题
echo "安装特定版本的pyzmq以避免兼容性问题..."
pip install pyzmq==25.1.1

pip install jupyter

# 安装Matplotlib及其依赖
echo "安装Matplotlib及其依赖..."
pkg install -y libjpeg-turbo libtiff
pip install pillow
pkg install -y freetype libpng
pkg install matplotlib

# 配置Matplotlib以支持中文显示
echo "配置Matplotlib以支持中文显示..."
# 替换为您下载的中文字体文件路径
cp -i simsunb.ttf /data/data/com.termux/files/usr/share/fonts/truetype/ || echo "字体文件复制失败，请手动复制"
fc-cache -f -v
# 编辑matplotlib配置文件以使用中文字体
sed -i 's/#font.sans-serif :.*/font.sans-serif : simsunb/g' /data/data/com.termux/files/usr/lib/python3.11/site-packages/matplotlib/mpl-data/matplotlibrc

# 清除matplotlib缓存
echo "清除matplotlib缓存..."
rm -rf ~/.cache/matplotlib

# 安装成功提示
echo "安装完成！"

# 启动Jupyter Notebook
echo "启动Jupyter Notebook..."
jupyter notebook

# 注意：在启动Jupyter Notebook之前，请确保Termux具有后台运行权限。