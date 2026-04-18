# GitHub issue template

## Title

Imperative, self-contained, no trailing period. Should work as a commit message if clawy uses it that way.

Good: `Center header controls on second line`
Good: `Fix flaky test in auth module`
Bad: `the header is off` (not imperative, not descriptive)
Bad: `Centering the header controls on the second line of the header component` (too long)

## Body

Four sections. Keep it terse. Clawy needs enough to act, not a design doc.

```markdown
## Summary
One or two sentences describing what needs to change.

## Current behavior
What happens now. Be specific. Reference files or components if known.

## Expected behavior
What should happen instead. Be specific about the success condition.

## Notes
- Constraints (e.g. "do not change X")
- Things to verify (e.g. "check responsive behavior")
- Anything tangential but relevant

---
_Filed via agent-ops ping-clawy skill._
```

## Rules

- Do NOT include local filesystem paths (e.g. `D:\Dev\...`). Clawy works on a different machine.
- Do NOT assign humans or add labels unless the user explicitly asks.
- Do NOT reference the user's private context unless the user included it in the request.
- Keep the body under ~300 words. If the task needs more, it should probably be multiple issues.
