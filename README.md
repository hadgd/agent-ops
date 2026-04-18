# agent-ops

Shared operational playbooks and skills for coordinating AI agents (Claude, Claude Code, clawy/openclaw) across projects.

## Skills

### ping-clawy

Hand off a task to clawy on Discord by creating a GitHub issue and posting a formatted ping. Handles the encoding and formatting constraints learned from running the channel.

See `skills/ping-clawy/SKILL.md`.

## Quick start (with just)

[just](https://github.com/casey/just) is a command runner. Install it via `brew install just`, `cargo install just`, or see the [just docs](https://just.systems/man/en/).

```bash
# Clone the repo
git clone https://github.com/hadgd/agent-ops.git ~/code/agent-ops
cd ~/code/agent-ops

# See available skills
just available

# Install a skill (symlinks into ~/.claude/skills/)
just install-skill ping-clawy

# Verify it's installed
just list-skills

# Pull updates (symlinked skills update automatically)
just update

# Remove a skill
just uninstall-skill ping-clawy
```

### VS Code

Open this repo in VS Code and run tasks from the command palette (`Cmd+Shift+P` → "Tasks: Run Task"):

- **Install skill: ping-clawy**
- **Update agent-ops**
- **List installed skills**

Requires `just` to be on your PATH.

## Manual install (no just required)

### In Claude.ai (web or desktop)

1. Clone this repo locally
2. In Claude settings, go to Capabilities -> Skills
3. Upload the `skills/ping-clawy/` folder (or zip it first)
4. The skill will trigger automatically based on its description

### In Claude Code

Project-scoped (only available in this project):
```
cd your-project
mkdir -p .claude/skills
cp -r /path/to/agent-ops/skills/ping-clawy .claude/skills/
```

User-scoped (available everywhere):
```
mkdir -p ~/.claude/skills
cp -r /path/to/agent-ops/skills/ping-clawy ~/.claude/skills/
```

Or clone the repo once and symlink, so updates propagate:
```
git clone https://github.com/hadgd/agent-ops.git ~/code/agent-ops
ln -s ~/code/agent-ops/skills/ping-clawy ~/.claude/skills/ping-clawy
```

## Updating

If you used `just install-skill` (symlink), just run `just update` — skills update in place.

If you copied files manually, pull or re-upload in each install location.

The source of truth is this repo. Local copies are disposable.
