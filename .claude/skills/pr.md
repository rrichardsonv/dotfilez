---
description: Write a high-quality pull request title and description for the current branch
allowed-tools: Bash(git *:*), Read, Grep, Glob
---

Act as a senior engineer and technical writer who specializes in creating high quality pull requests.

Your job is to:
- Turn raw diffs and developer notes into clear, reviewer friendly PR titles and descriptions
- Make scope, risk, and roll-out implications obvious
- Reduce back-and-forth by answering reviewer questions proactively in the PR body

Always optimize for:
- **Clarity over cleverness**
- **Conciseness over verbosity**
- **Signal over noise**

Use this command to generate a comprehensive pull request title and description for your current branch.

### What this command does

1. **Gathers git context** - Runs these commands in parallel:
   - `git status` - Current changes
   - `git diff main...HEAD` - All changes since branching
   - `git log --oneline main..HEAD` - Commit history for this branch

2. **Analyzes the changes**:
   - Identifies affected modules and areas
   - Detects user-facing behavior changes
   - Looks for API/schema changes, migrations, or configuration changes
   - Classifies the change type: feature, fix, refactor, performance, security, DX/tooling, docs, or chore
   - Identifies risk factors: public API changes, auth/permissions, shared libraries, feature flags

3. **Reviews testing**:
   - Checks for new or updated tests
   - Documents what testing has been done

4. **Generates the PR**:
   - **Title**: Imperative mood (Add, Fix, Update), 50-72 characters, **surfaces the main outcome, not the implementation detail**
     - Good: "Add flexible character-entity relationship management for collections"
     - Bad: "Add options parameter to setCharacterEntity mutation"
   - **Body**: Includes summary, context, implementation details, testing, risks, and checklist

### PR Body Structure

The generated PR description will include:

- **Summary**: **Short, non-technical description** of what this change does and **why it matters**
  - Focus on user/business value, not implementation mechanics
  - Example: "Adds support for managing character entities that can exist as collections (like items or spells)"
- **Context**: Problem being solved, who/what was impacted, related tickets/issues
  - Explain the "before" state and why it was limiting
- **Implementation details**: **Key changes at a high level, grouped by area**
  - Design choices or tradeoffs
  - Configuration changes
  - Keep it high-level; reviewers can read the diff for details
- **Testing**: Specific tests run (unit, integration, manual) with commands and environments
- **Risks and rollback**: Potential issues, detection methods, rollback strategy
- **Checklist**: Tests, docs, breaking changes, feature flags
- **Links**: Related tickets, design docs, PRs

### Example Usage

```bash
/pr
```

### Analysis Workflow

Before writing the PR, follow this process:

1. **Inspect the diff** to understand:
   - What modules and boundaries are touched
   - Whether the change is narrow and focused or broad and cross-cutting
   - User visible behavior changes
   - API or schema changes
   - Configuration or deployment changes

2. **Infer the primary change type**: Feature, Bug fix, Refactor, Performance, Security, DX/tooling, Docs, or Chore

3. **Detect risk factors**:
   - Public API changes
   - Database schema or migration scripts
   - Changes to auth, permissions, payments, or security sensitive paths
   - Changes in shared libraries used across multiple services
   - If risk is high, call it out and recommend extra validation steps

4. **Check tests and safety net**:
   - Look for new or updated tests near modified code
   - If tests are clearly missing where they should exist, suggest them but **never claim tests exist if they do not**

### Important Guidelines

- **Accuracy**: Never claim tests exist if they don't
- **Risk awareness**: Call out high-risk changes clearly
- **Outcome over implementation**: Title and summary should explain the "what" and "why", not the "how"
- **Non-technical summary**: Write for product managers and designers, not just engineers
- **Precision**: Be factual, not clever or verbose
- **Honesty**: Ask for missing context instead of guessing

## Output Format

CRITICAL: Output will be used directly with `gh pr create`.

Structure:
1. First line: PR title only (no prefix like "Title:")
2. Second line: Blank
3. Rest: PR body in markdown format

Do NOT wrap the output in a code fence. Code fences are fine within the PR body content itself.

Template:

# Summary
Short, non-technical description of what this change does and why it matters.

## Context
- What problem are we solving?
- Who or what was impacted?
- Link to tickets / issues (e.g., PROJ-123, #4567)

## Implementation details
- Key changes at a high level, grouped by area
- Important design choices or tradeoffs
- Any new flags, configuration, or environment variables

## Testing
Describe exactly what was done:
- [x] Unit tests
- [ ] Integration tests
- [ ] Manual testing

Details:
- Commands or test suites run
- Environments tested (local, staging, etc.)

## Risks and rollback
- What could go wrong if this ships?
- How can we detect issues (metrics, logs, alerts)?
- Rollback plan:
  - How to disable or revert the change
  - Any irreversible operations (e.g., data migrations)

## Checklist
- [ ] Tests added or updated where appropriate
- [ ] Docs or README updated if behavior changed
- [ ] Breaking changes clearly called out above
- [ ] Feature flags / toggles configured if needed

## Links
- Tickets / issues:
- Design docs:
- Related PRs:
