# AnimConverser V9 

A animation utility for **Roblox Studio** that lets you **extract, serialize, and re-import animations** as fully editable `KeyframeSequence` objects — with **selection-based exporting** and a dedicated **Studio plugin importer**.

---

##  Overview

**AnimConvser V9** is a two-part animation workflow tool:

1. **Main Script (Run In a Executor) (Exporter)**  
   Scans active and stored `Animation` objects, previews them on your character, and exports selected animations into a serialized JSON format.

2. **Roblox Studio Plugin (Importer)**  
   Takes the exported data and reconstructs it into proper `KeyframeSequence` instances directly inside Studio.

This allows you to convert animations you **don’t own**, **can’t edit**, or **only have runtime access to** into editable sequences without recreating them manually.

---

##  Key Features

### Exporter (LocalScript)
- Live animation preview on your character
- Local & global animation scanning
- Checkbox-based multi-selection
- Select All / None / Invert tools
- Name & ID filtering
- Per-animation or bulk export
- Clipboard-ready JSON output
- Stops preview on movement (optional)
- Looping preview support

### Importer (Studio Plugin)
- Dockable plugin window
- Paste-to-import workflow
- Rebuilds full animation hierarchy:
  - `KeyframeSequence`
  - `Keyframes`
  - Nested `Pose` trees
- Preserves:
  - CFrames
  - Weights
  - Easing styles & directions
  - Looping & priority
- Automatically organizes imports by source
- ChangeHistory waypoint support (undo friendly)

---

## 🛠 How It Works

### 1. Export Phase (In-Game)
- The script detects animations from:
  - Currently playing tracks (Local)
  - `ReplicatedStorage`, `StarterPack`, and `Workspace` (Global Scan)
- Selected animations are fetched via asset ID
- Each animation is serialized into structured JSON:
  - Keyframes
  - Pose hierarchy
  - CFrame precision trimming
- The result is copied directly to your clipboard

### 2. Import Phase (Studio Plugin)
- Paste the exported JSON into the plugin
- Click **IMPORT**
- Animations are reconstructed as editable `KeyframeSequence` objects
- Output is placed into organized folders in `Workspace`

---

##  Output Structure

