---
name: gh-op-wrapper
description: Wrap gh (GitHub CLI) commands with `op plugin run --` (1Password CLI) to inject secrets automatically. Use this skill whenever you are about to run any `gh` command such as `gh pr`, `gh issue`, `gh repo`, `gh auth`, `gh api`, or any other gh subcommand. Instead of `gh <args>`, always run `op plugin run -- gh <args>`.
---

# gh-op-wrapper

When running any `gh` (GitHub CLI) command, always wrap it with `op plugin run --`.

## Rule

Instead of:
```
gh <subcommand> <args>
```

Always run:
```
op plugin run -- gh <subcommand> <args>
```

## Why

`op plugin run` uses 1Password's Shell Plugin feature. Since the `gh` plugin is configured in 1Password, it automatically resolves and injects the GitHub token without any additional environment variable setup.

## Examples

| What you want to do | Command to run |
|---|---|
| List pull requests | `op plugin run -- gh pr list` |
| Create a PR | `op plugin run -- gh pr create` |
| View an issue | `op plugin run -- gh issue view 123` |
| Call the API | `op plugin run -- gh api repos/:owner/:repo` |
| Check auth status | `op plugin run -- gh auth status` |

## Notes

- Apply this rule to every `gh` invocation without exception.
- Do not omit `op plugin run --` even for read-only or non-sensitive operations — consistency is important to avoid accidentally running gh without credentials.
- If `op` is not installed or the user asks to skip 1Password injection, ask the user before proceeding without it.
