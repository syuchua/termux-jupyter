# Termux Jupyter 环境安装脚本

本脚本旨在简化在 Termux 中安装 Python 及其常用库（如 Jupyter Notebook、NumPy、Pandas 和 Matplotlib）的过程。兼容python3.11和Android14

## 环境要求

- Android 7.0 或更高版本
- Termux 0.118 或更新版本

## 安装步骤

1. 确保您的设备满足环境要求。
2. 安装 Termux 应用（可以从 F-Droid 或 Google Play 商店下载）。
3. 在 Termux 中运行以下命令以下载并执行安装脚本：

ps:脚本中有部分关于替换matplotlib字体以支持显示中文的内容，默认关闭，如果您有需要可选择克隆仓库并将脚本51-60行有关内容取消注释

```
bash
curl -L https://raw.githubusercontent.com/syuchua/termux-jupyter/master/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

或者，如果您更喜欢使用 `wget`：

```
bash
wget https://raw.githubusercontent.com/syuchua/termux-jupyter/master/install.sh -O install.sh
chmod +x install.sh
./install.sh
```

4. 按照脚本中的提示操作。

## 支持的软件包

- Python 3.11.2
- NumPy
- Pandas
- Jupyter Notebook
- Matplotlib

## 解决的问题

- **Pandas 安装问题**：脚本通过特定的方法自动安装与 Pandas 兼容的 NumPy 版本。
- **Jupyter Notebook 安装问题**：通过安装必要的依赖项，解决了 Jupyter Notebook 的安装依赖问题。

## 注意事项

- 在运行脚本之前，请确保您已经更换了 Termux 的软件源到清华大学镜像源，以加快下载速度。
- 脚本中的字体文件 `simhei.ttf`（或 `msyh.ttc`）需要您根据实际情况替换为正确的路径。
- 本脚本假定您已经给予了 Termux 后台运行权限。

## 贡献

欢迎贡献！如果您发现任何问题或有改进建议，请通过 GitHub 仓库的 Issues 功能或直接提交 Pull Request。

