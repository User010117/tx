# 项目发现记录

## 2026-05-19
- 当前目录：`D:\GITTest`。
- 已存在 `.git` 目录，仓库尚无提交，当前分支为 `master`。
- 初始文件列表包含 `212121.txt`。
- 当前未配置 Git 远端。
- 目标 GitHub 仓库：`https://github.com/User010117/tx.git`。
- 已成功配置远端 `origin` 指向目标仓库。
- 已成功推送本地 `master` 分支到 `origin/master`。
- 已发现新的未跟踪文件 `9876.txt`，本次未处理。
- Git 全局配置已设置为更适合中文显示：中文文件名不转义，提交与日志编码为 UTF-8。
- 用户级环境变量已设置：`LANG=zh_CN.UTF-8`、`LANGUAGE=zh_CN`。
- 当前 Git for Windows 未发现中文 `git.mo` 翻译文件，因此 Git 状态提示仍可能显示英文。
- Codex 聊天记录位于 `C:\Users\27346\.codex\sessions`，归档记录位于 `C:\Users\27346\.codex\archived_sessions`。
- 为避免泄露敏感信息，不应把整个 `C:\Users\27346\.codex` 目录复制进项目。
- 项目内新增 `scripts/export-codex-chat.ps1`，用于将会话 `.jsonl` 导出到 `chat_exports`。
- `chat_exports/.gitignore` 默认忽略 `.jsonl`，需要明确强制添加才会上传聊天记录。
- 新增 `scripts/import-codex-chat.ps1`，可将项目 `chat_exports` 中的 `.jsonl` 恢复到本机 `~\.codex\sessions` 日期目录。
- 新增 `scripts/sync-codex-chat.ps1`，用于快速执行导出，并可选执行导入。
- Codex 原生聊天存储仍在用户目录；项目级跨设备同步需要显式导出、提交、拉取、导入。
