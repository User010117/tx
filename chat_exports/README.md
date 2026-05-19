# 聊天记录导出

这里用于保存从 `C:\Users\27346\.codex\sessions` 导出的 Codex 会话记录。

使用方式：

```powershell
# 导出最近一次会话
.\scripts\export-codex-chat.ps1

# 导出全部会话
.\scripts\export-codex-chat.ps1 -All
```

注意：聊天记录可能包含本地路径、仓库地址、命令输出或其他隐私内容。上传到 GitHub 前请确认内容可以公开。

默认情况下，`*.jsonl` 聊天记录会被 `chat_exports/.gitignore` 忽略，避免误传。

确认要上传某个聊天记录时，可以强制添加：

```powershell
git add -f chat_exports\2026-05-19\你的会话文件.jsonl
git commit -m "Add chat export"
git push
```
