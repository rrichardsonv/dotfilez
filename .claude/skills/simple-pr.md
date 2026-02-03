---
description: Write a concise pull request for minor changes
allowed-tools: Bash(git *:*), Read, Grep, Glob
---

Create a simple, concise pull request title and description for minor changes.

Use this for:
- Small bug fixes
- Minor refactors
- Documentation updates
- Chores and cleanup
- Simple feature additions

### What this command does

1. **Gathers git context**:
   - `git status` - Current changes
   - `git diff main...HEAD` - All changes since branching
   - `git log --oneline main..HEAD` - Commit history

2. **Generates a concise PR**:
   - **Title**: Imperative mood, 50-72 characters, outcome-focused
   - **Body**: Brief summary, changes list, testing notes

### Output Format

CRITICAL: Output will be used directly with `gh pr create`.

Structure:
1. First line: PR title only (no prefix)
2. Second line: Blank
3. Rest: PR body in markdown

Template:

# Summary
Brief description of what this changes and why.

## Changes
- Key change 1
- Key change 2
- Key change 3

## Testing
- [x] Tests pass
- [ ] Manual verification (if needed)

## Notes
Any additional context, risks, or follow-up items (optional).
