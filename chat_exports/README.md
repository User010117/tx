# 聊天记录导出

这里用于保存从 `C:\Users\27346\.codex\sessions` 导出的 Codex 会话记录。

使用方式：

```powershell
# 导出最近一次会话
.\scripts\export-codex-chat.ps1

# 导出全部会话
.\scripts\export-codex-chat.ps1 -All
```

跨设备同步流程：

```powershell
# 设备 A：导出聊天
.\scripts\export-codex-chat.ps1 -All

# 设备 A：确认可以上传后，强制添加聊天记录并推送
git add -f chat_exports\*.jsonl chat_exports\**\*.jsonl
git commit -m "Sync chat exports"
git push

# 设备 B：拉取项目
git pull

# 设备 B：把项目里的聊天记录导入到本机 Codex sessions
.\scripts\import-codex-chat.ps1
```

注意：聊天记录可能包含本地路径、仓库地址、命令输出或其他隐私内容。上传到 GitHub 前请确认内容可以公开。

默认情况下，`*.jsonl` 聊天记录会被 `chat_exports/.gitignore` 忽略，避免误传。

确认要上传某个聊天记录时，可以强制添加：

```powershell
git add -f chat_exports\2026-05-19\你的会话文件.jsonl
git commit -m "Add chat export"
git push
```

说明：

- Codex 默认仍会把新聊天写入本机 `~\.codex\sessions`。
- 要让后续聊天进入项目目录，需要在聊天后运行 `.\scripts\export-codex-chat.ps1` 或 `.\scripts\export-codex-chat.ps1 -All`。
- 不建议把整个 `~\.codex` 放进项目，也不建议直接把 `~\.codex\sessions` 改成项目目录链接；那会把所有项目的聊天混在一起，也可能影响 Codex 的本地状态。
