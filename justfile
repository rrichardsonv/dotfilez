# Helper: Create PR from file (extracts title and body)
_create-pr-from-file file:
    #!/usr/bin/env bash
    tmpfile="{{file}}"
    bodyfile=$(mktemp --suffix=.md)
    ${EDITOR:-vim} "$tmpfile"
    if [ -s "$tmpfile" ]; then
        title=$(head -n 1 "$tmpfile")
        tail -n +3 "$tmpfile" > "$bodyfile"
        gh pr create --title "$title" --body-file "$bodyfile"
    else
        echo "PR creation aborted (empty message)"
    fi
    rm "$bodyfile"

# Generate commit message using Claude and open editor to review before committing
[positional-arguments]
commit *args:
    #!/usr/bin/env bash
    tmpfile=$(mktemp)
    gum spin --spinner dot --title "Generating commit message..." -- claude -p "/commit $@" > "$tmpfile"
    echo "✓"
    git commit -e -m "$(cat "$tmpfile")"
    rm "$tmpfile"


# Choose between simple and full PR
[positional-arguments]
pr *args:
 @just $(gum choose {simple-pr,full-pr}) "$@"

# Generate a fully detailed PR using Claude & open editor to review PR description
[positional-arguments]
full-pr *args:
    #!/usr/bin/env bash
    tmpfile=$(mktemp --suffix=.md)
    gum spin --spinner dot --title "Generating PR description..." -- claude -p "/pr $@" > "$tmpfile"
    just _create-pr-from-file "$tmpfile"
    rm "$tmpfile"

# Generate a simple PR using Claude & open editor to review PR description
[positional-arguments]
simple-pr *args:
    #!/usr/bin/env bash
    tmpfile=$(mktemp --suffix=.md)
    gum spin --spinner dot --title "Generating Simple PR description..." -- claude -p "/simple-pr $@" > "$tmpfile"
    just _create-pr-from-file "$tmpfile"
    rm "$tmpfile"
