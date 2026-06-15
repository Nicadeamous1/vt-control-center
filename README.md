# Vista Table — Control Center

Static landing page for the Vista Table project. Live at
**https://nicadeamous1.github.io/vt-control-center/**

The page is a single self-contained `index.html`. It is regenerated locally by
`VistaTable_AI/Source/vt_tools.py` — every call to `add_project_log(...)`
re-injects the agent status block at the top of the HTML.

To publish a refresh after a local log:

```powershell
cd "D:\Vista Table\vt-control-center"
.\vt-push.ps1 "Short description of what changed"
```

That commits the updated `index.html` and pushes to GitHub. GitHub Pages
takes ~30s to rebuild the live page after a push.
