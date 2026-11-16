

## 📋 Prerequisites

1. **Python 3.8+** (required to run helper validation scripts and environment tools).
2. **Atlassian Jira MCP Server** (installed and running in your agent/assistant framework).
3. **Codex CLI** (optional, required if running through automated shell commands).

---

## 🛠️ Step-by-Step Setup

### Step 1: Configure the Team Map

The Sprint Guardian relies on a team map to understand assignee skills, capacity, and approval scopes.

1. Navigate to the `references/` directory.
2. Copy `team-map.example.yaml` and rename it to `team-map.local.yaml`:
   ```bash
   cp references/team-map.example.yaml references/team-map.local.yaml
   ```
3. Open `team-map.local.yaml` and configure your:
   * **Jira Board ID** and **Project Key** (default is set to `CodinzHub`).
   * **Assigning Authorities** (e.g. Coder Coder with email `coder.coder@codinzhub.com`).
   * **Team Directory** (list your engineers, their skills, capacity points, and max WIP limits).

---

### Step 2: Initialize Python Virtual Environment

Helper utilities like the skill validator search for a virtual environment located in the parent directory.

1. Navigate to the parent directory of this skill.
2. Create and configure a virtual environment named `.venv-jira-tools`:
   ```bash
   python -m venv .venv-jira-tools
   source .venv-jira-tools/bin/activate  # On Windows: .venv-jira-tools\Scripts\activate
   pip install pyyaml  # Required dependency for team map parsing
   ```

---

### Step 3: Install the Skill

You can link this skill to your local Codex framework setup:

```bash
./automation/codinzhub-install-skill.sh
```
This script symlinks the folder into your local `~/.codex/skills/` directory.

---

### Step 4: Validate Your Configuration

Run the validator script to verify that your YAML structure and skill file syntax are correct:

```bash
./automation/codinzhub-validate-skill.sh
```

---

## 🚀 Usage & Modes

Once configured, you can trigger specific sprint workflows using the wrappers inside the `automation/` folder:

* **Triage Backlog**:
  ```bash
  ./automation/codinzhub-triage-queue.sh
  ```
* **Recommend Assignees**:
  ```bash
  ./automation/codinzhub-suggest-owner.sh --issue-keys "CodinzHub-101"
  ```
* **Shape Sprint Scope**:
  ```bash
  ./automation/codinzhub-shape-sprint.sh --board-id 1234
  ```
* **Check Sprint Health**:
  ```bash
  ./automation/codinzhub-inspect-sprint.sh
  ```
* **Standup Prep**:
  ```bash
  ./automation/codinzhub-standup-brief.sh
  ```

Add `--apply --approved-by "Coder Coder"` to write changes back to Jira (mutations require human approval).

---

*Created by **Coder Coder** | [CodinzHub Projects](https://www.codinzhub.com/projects)*
