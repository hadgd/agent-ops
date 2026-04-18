# Discord ping template

## Format

Literal template (single line, ASCII, under 400 chars):

```
<@CLAWY_USER_ID> new issue on OWNER/REPO #N TITLE. URL over to you
```

## Example

```
<@1464872378935803968> new issue on hadgd/nami #1 Center header controls on second line. https://github.com/hadgd/nami/issues/1 over to you
```

## Rules

- Start with the mention, no leading text
- Use the repo slug `owner/repo`, not the full URL, for the repo identifier
- Include the issue number as `#N`
- Use the issue title verbatim (no quotes, no truncation unless over length budget)
- Include the full issue URL
- End with `over to you` as a sign-off (plain ASCII, no emoji)
- Do NOT include: backticks, em-dashes, newlines, emojis, non-ASCII

## If the message is blocked

1. Retry without the sign-off (`over to you`)
2. Retry with title shortened to the first 6-8 words
3. If still blocked, report the failure and the issue URL to the user so they can ping manually
