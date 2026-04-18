# agent-ops justfile
# Cross-platform skill management for Claude Code

set shell := ["bash", "-cu"]

skills_dir := env("HOME") / ".claude" / "skills"
repo_root  := justfile_directory()

# Install a skill by symlinking it into ~/.claude/skills/
install-skill name:
    mkdir -p "{{skills_dir}}"
    @if [ -e "{{skills_dir}}/{{name}}" ]; then \
        echo "⚠  {{name}} already exists at {{skills_dir}}/{{name}}"; \
        echo "   Run 'just uninstall-skill {{name}}' first to reinstall."; \
        exit 1; \
    fi
    @if [ ! -d "{{repo_root}}/skills/{{name}}" ]; then \
        echo "✗ Skill '{{name}}' not found in {{repo_root}}/skills/"; \
        exit 1; \
    fi
    ln -s "{{repo_root}}/skills/{{name}}" "{{skills_dir}}/{{name}}"
    @echo "✓ Installed {{name}} → {{skills_dir}}/{{name}}"
    @ls -l "{{skills_dir}}/{{name}}"

# Remove an installed skill
uninstall-skill name:
    @if [ ! -e "{{skills_dir}}/{{name}}" ]; then \
        echo "✗ {{name}} is not installed at {{skills_dir}}/"; \
        exit 1; \
    fi
    rm -f "{{skills_dir}}/{{name}}"
    @echo "✓ Uninstalled {{name}}"

# List installed skills and their sources
list-skills:
    @echo "Installed skills in {{skills_dir}}:"
    @echo "---"
    @if [ -d "{{skills_dir}}" ]; then \
        for s in "{{skills_dir}}"/*; do \
            [ -e "$s" ] || continue; \
            name=$(basename "$s"); \
            if [ -L "$s" ]; then \
                target=$(readlink "$s"); \
                echo "  $name → $target (symlink)"; \
            else \
                echo "  $name (copy)"; \
            fi; \
        done; \
    else \
        echo "  (none — {{skills_dir}} does not exist)"; \
    fi

# Pull latest changes from remote
update:
    git -C "{{repo_root}}" pull
    @echo "✓ agent-ops updated. Symlinked skills are already current."

# Show available skills in this repo
available:
    @echo "Available skills:"
    @for s in "{{repo_root}}/skills"/*/; do \
        [ -d "$s" ] || continue; \
        echo "  $(basename "$s")"; \
    done
