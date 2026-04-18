---
name: ping-clawy
description: Use this skill whenever the user wants to file a GitHub issue and hand it off to clawy (the openclaw Discord bot) for execution. Triggers include requests to create an issue and ping clawy, ask clawy to do something, or any workflow where a task is being handed off via Discord to an agent that picks up work from GitHub issues. Handles the full flow: issue creation, message formatting constraints, and the Discord ping.
---

# ping-clawy

Hand off a task to clawy (openclaw bot on Discord) by filing a GitHub issue and posting a single-line Discord ping that links to it.

## When to use

- User says something like "create an issue and ping clawy", "ask clawy to fix X", "have clawy do Y"
- User describes a task in one of the allowlisted repos (see `config.json`) and wants it handed off
- User provides an existing issue URL and asks clawy to pick it up

Do NOT use this skill to:
- Do the coding work yourself in chat (clawy does the work)
- Ping clawy for conversation or questions (this skill is for issue handoff only)
- File issues without pinging (just use the GitHub tool directly)

## The flow

1. Read `config.json` for the channel ID, clawy user ID, and allowlisted repos
2. Confirm the target repo is in the allowlist; if not, stop and ask the user
3. Create the GitHub issue using the template in `issue-template.md`
4. Post a Discord ping using the template in `message-template.md`
5. Report back to the user with the issue URL and message ID

## Hard constraints on the Discord ping

These are learned from trial and error. Violating them has caused messages to be dropped or mangled.

- **ASCII only.** No emojis, em-dashes, smart quotes, or non-Latin characters. The MCP server's encoding is unreliable for anything outside ASCII.
- **Single line.** No newlines in the message body. Multi-line messages have been silently blocked.
- **Mention first.** The message MUST start with `<@CLAWY_USER_ID>` so it registers as a trigger, not a passive mention.
- **No backticks.** They've correlated with blocked messages. Use plain text for repo slugs.
- **Under 400 characters.** Longer messages risk being flagged.
- **Always include the issue URL.** It is the one piece of information clawy cannot infer.

## Protocol conventions (our side only)

We do not control clawy's behavior. These are conventions on the sender side:

- **One ping per issue.** Do not re-ping the same issue unless the user explicitly asks.
- **No local paths.** Clawy works on a different machine. Never mention `D:\...` or similar.
- **No human assignees or labels** unless the user specifies them. Keep the issue minimal.
- **If the ping is blocked:** try again with further simplification (drop punctuation, shorten). If still blocked, report the failure to the user with the issue URL so they can ping manually.

## What we do NOT assume about clawy

- We do not assume clawy acknowledges, reacts, queues, reports failures, or responds on any particular channel.
- We do not poll for clawy's response. If the user asks "did clawy pick it up?", we can read the Discord channel or the GitHub issue to check, but we do not do this automatically.

## Files in this skill

- `SKILL.md` (this file) - when and how to use
- `config.json` - channel ID, clawy user ID, allowed repos. Edit this when IDs or scope change.
- `message-template.md` - the literal Discord message format
- `issue-template.md` - the GitHub issue title and body structure
