---
description: Generate a Conventional Commits 1.0.0 compliant commit message from your changes
allowed-tools: Read, Grep, Glob, Bash
argument-hint: "[diff-or-description]"
---

Act as a senior engineer and technical writer who specializes in creating high quality commit messages.

Generate a Conventional Commits 1.0.0 compliant message by analyzing git changes.

## Process

1. **Gather context:**
   ```bash
   git status                    # Current state
   git diff --cached             # Staged changes (or git diff if nothing staged)
   git log --oneline -10         # Recent commits for style
   ```

2. **Analyze and generate** the commit message following the spec below

3. **Output** the commit message following the Output Format section at the end

## Conventional Commits Structure

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Type Selection (CRITICAL)

- **`feat`**: New feature for users (→ MINOR in SemVer)
- **`fix`**: Bug fix for users (→ PATCH in SemVer)
- **Other types**: `build`, `chore`, `ci`, `docs`, `style`, `refactor`, `perf`, `test`

## Rules

1. **Type** (required): Lowercase, from list above
2. **Scope** (optional): Noun in parentheses, e.g., `(api)`, `(parser)`, `(ui)`
3. **Description** (required): Lowercase, imperative mood, no period
4. **Breaking changes** (→ MAJOR in SemVer):
   - Add ! after type/scope, OR
   - Add footer: `BREAKING CHANGE: description`
5. **Body**: Optional, separated by blank line, wrap at 72 chars
6. **Footers**: Optional, separated by blank line, e.g., `Fixes #123`, `Reviewed-by: Name`

## Important Guidelines

Always optimize for:
- **Clarity over cleverness**
- **Conciseness over verbosity**
- **Signal over noise**
- **Outcome over implementation**: Description should explain the "what" and "why", not the "how"
- **Non-technical summary**: Write for product managers and designers, not just engineers
- **Precision**: Be factual, not clever or verbose
- **Honesty**: Ask for missing context instead of guessing

## Specification

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT",
"RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

1. Commits MUST be prefixed with a type, which consists of a noun, `feat`, `fix`, etc., followed by
   the OPTIONAL scope, OPTIONAL **!**, and REQUIRED terminal colon and space.
2. The type `feat` MUST be used when a commit adds a new feature to your application or library.
3. The type `fix` MUST be used when a commit represents a bug fix for your application.
4. A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the
   codebase surrounded by parenthesis, e.g., fix(parser):
5. A description MUST immediately follow the colon and space after the type/scope prefix. The
   description is a short summary of the code changes, e.g., *fix: array parsing issue when multiple
   spaces were contained in string.*
6. A longer commit body MAY be provided after the short description, providing additional contextual
   information about the code changes. The body MUST begin one blank line after the description.
7. A commit body is free-form and MAY consist of any number of newline separated paragraphs.
8. One or more footers MAY be provided one blank line after the body. Each footer MUST consist of a
   word token, followed by either a `:<space>` or `<space>#` separator, followed by a string value
   (this is inspired by the git trailer convention).
9. A footer's token MUST use `-` in place of whitespace characters, e.g., `Acked-by` (this helps
   differentiate the footer section from a multi-paragraph body). An exception is made for `BREAKING
   CHANGE`, which MAY also be used as a token.
10. A footer's value MAY contain spaces and newlines, and parsing MUST terminate when the next valid
    footer token/separator pair is observed.
11. Breaking changes MUST be indicated in the type/scope prefix of a commit, or as an entry in the
    footer.
12. If included as a footer, a breaking change MUST consist of the uppercase text BREAKING CHANGE,
    followed by a colon, space, and description, e.g., *BREAKING CHANGE: environment variables now
    take precedence over config files.*
13. If included in the type/scope prefix, breaking changes MUST be indicated by a **!** immediately
    before the `:`. If **!** is used, `BREAKING CHANGE:` MAY be omitted from the footer section, and
    the commit description SHALL be used to describe the breaking change.
14. Types other than `feat` and `fix` MAY be used in your commit messages, e.g., *docs: update ref
    docs.*
15. The units of information that make up Conventional Commits MUST NOT be treated as case sensitive
    by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
16. BREAKING-CHANGE MUST be synonymous with BREAKING CHANGE, when used as a token in a footer.

## Examples

### Commit with description and breaking change footer
```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

### Breaking change with ! and scope
```
feat(api)!: send an email to the customer when a product is shipped
```

### No body
```
docs: correct spelling of CHANGELOG
```

### Scope
```
feat(lang): add Polish language
```

### Multi-paragraph body and footers
```
fix: prevent racing of requests

Introduce a request id and a reference to latest request. Dismiss
incoming responses other than from latest request.

Remove timeouts which were used to mitigate the racing issue but are
obsolete now.

Reviewed-by: Z
Refs: #123
```

## Output Format

CRITICAL: Output will be used directly with `git commit -e -m "$(claude /commit)"`.

Rules:
1. Start immediately with the commit message (type, scope, description)
2. NO introductory text like "Based on..." or "Here's the commit message:"
3. NO markdown code fences (```)
4. After the commit message, add explanatory notes with EVERY line prefixed by `# `

Example correct format:
```
feat(web): add actions and effects panels to character editor

Create dedicated ActionsLayout and EffectsLayout components for managing
character actions, effects, and items.

# Type choice: feat (feature)
# This adds new user-facing functionality (actions and effects management)
# alongside refactoring existing code to support these features.
```

Example WRONG format:
```
Based on the staged changes, here's the commit message:

feat(web): add actions and effects panels

Type choice: feat (feature)
```

