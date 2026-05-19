# 项目任务计划

## 目标
将当前项目目录 `D:\GITTest` 初始化并上传到 GitHub 仓库 `User010117/tx.git`。

## 阶段

| 阶段 | 状态 | 内容 |
| --- | --- | --- |
| 1 | complete | 检查项目目录、Git 状态、远端配置 |
| 2 | complete | 创建项目记忆与进度文件 |
| 3 | complete | 添加 GitHub 远端并提交当前文件 |
| 4 | complete | 推送到 GitHub |
| 5 | complete | 记录结果与后续注意事项 |
| 6 | complete | 配置本地 Git 客户端中文与 UTF-8 显示 |
| 7 | complete | 添加聊天记录导出到项目目录的方案 |
| 8 | complete | 支持跨设备导入和同步聊天记录 |
| 9 | complete | 安装 Deep Code VS Code 插件 |
| 10 | complete | 安装 DeepSeek-TUI 终端客户端 |
| 11 | complete | 安装并验证 Hermes Agent |

## 决策
- 使用当前已有 Git 仓库，不重新初始化。
- 远端目标为 `https://github.com/User010117/tx.git`。
- 首次提交包含当前目录内全部未跟踪文件，包括项目规划文件。
- 当前仓库未配置提交身份，使用本地仓库级配置 `User010117 <User010117@users.noreply.github.com>`。
- 已将本地 `master` 分支推送到远端 `origin/master`。
- 已配置全局 Git 编码与语言环境：`LANG=zh_CN.UTF-8`、`LANGUAGE=zh_CN`、`core.quotepath=false`、`i18n.*=utf-8`。
- 当前 Git for Windows 安装未发现中文翻译文件，命令提示文字可能仍显示英文；重开终端后环境变量对支持中文翻译的 Git 组件生效。
- 聊天记录不建议直接同步整个 `.codex` 目录，避免泄露认证和内部状态文件；采用脚本只导出 `.codex\sessions` 下的 `.jsonl` 会话文件。
- `chat_exports/*.jsonl` 默认被忽略，防止误上传；如需上传某个会话，使用 `git add -f` 强制添加。
- 跨设备读取采用导出/导入方案：项目保存 `chat_exports`，另一台设备拉取后运行导入脚本复制到本机 Codex sessions。
- Deep Code Marketplace 扩展 ID `vegamo.deepcoding` 未能通过 `code --install-extension` 找到；改为从 `lessweb/deepcode` 源码打包 VSIX 后安装。
- 已安装 VS Code 扩展 `vegamo.deepcode-vscode@0.1.17`。
- 本机已存在 `~\.deepcode\settings.json` 配置文件，未覆盖，也未记录 API Key。
- 已通过 npm 全局安装 `deepseek-tui@0.8.39`，命令 `deepseek` 和 `deepseek-tui` 均可用。
- 当前尚未发现 `~\.deepseek` 配置目录，DeepSeek-TUI 首次使用仍需执行登录或启动向导，不在项目中保存 API Key。
- Hermes Agent 已按官方 PowerShell 安装器安装/更新，当前版本 `v0.14.0`，路径为 `C:\Users\27346\AppData\Local\hermes\hermes-agent`。
- Hermes 配置位于 `C:\Users\27346\AppData\Local\hermes`，安装器保留已有 `.env` 和 `config.yaml`，未向项目写入任何密钥。
- `hermes doctor` 核心检查通过；可选项提示缺少部分第三方服务密钥、Docker、Discord/Telegram 包等，属于非必要能力。

## 遇到的错误
| 错误 | 尝试次数 | 解决方案 |
| --- | --- | --- |
| 无 | 0 | 暂无 |
| `code --install-extension vegamo.deepcoding` 找不到扩展 | 1 | 从 GitHub 源码构建 `.vsix` 并本地安装 |
| Hermes 旧版本提示落后 | 1 | 运行官方安装器更新到 `v0.14.0` |
