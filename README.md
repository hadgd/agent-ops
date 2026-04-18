# agent-ops

Shared operational playbooks and skills for coordinating AI agents (Claude, Claude Code, clawy/openclaw) across projects.

## Skills

### ping-clawy

Hand off a task to clawy on Discord by creating a GitHub issue and posting a formatted ping. Handles the encoding and formatting constraints learned from running the channel.

See `skills/ping-clawy/SKILL.md`.

## Installing skills

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

Edit the skill files in this repo, commit, push. Then in each install location, pull or re-upload.

The source of truth is this repo. Local copies are disposable.
