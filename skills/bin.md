---
name: Bin
description: Discover the local automation scripts in bin/, show usage help for each, and run them on request
command: /bin
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Bin

## Purpose

Discover, document, and run the local automation scripts in `bin/` (backups, workspace syncing, and any scripts added later) without anyone needing to memorize script names or flags. Bin is **read-only with respect to this repository's skill files** — it never edits anything under `bin/`, `skills/`, or `workspaces/` itself; it only inspects and executes the scripts already there (which may of course write their own output, e.g. a backup zip).

Bin is not a lifecycle step — it is a utility, callable at any time, independent of the active pursuit or backlog item.

## Steps

### 1. Discover available commands

List every executable file directly under `bin/` (non-recursive). Never hardcode script names in this skill or assume the current set (`backup.sh`, `sync.sh`) is fixed — new scripts may be added later and must be picked up automatically:

```bash
for f in bin/*; do [ -f "$f" ] && [ -x "$f" ] && basename "$f"; done | sort
```

Re-run this discovery every time the skill is invoked. Do not reuse a list remembered from an earlier turn in the conversation.

### 2. Get each command's usage from the tool itself

For every discovered script, run `bin/<script> --help` and treat its output as the single source of truth for what the tool does and how to use it. Do not describe a script's behavior from memory, from its name, or from reading its source — always defer to its own `--help` output.

Every script under `bin/` is expected to:
- support both `-h` and `--help`
- exit `0` when help is requested
- print a one-line description, a `Usage:` line, and any options/arguments

**If a script does not meet this bar** (errors out, exits non-zero, or has no recognizable help output), that is a bug to fix, not an acceptable end state:
1. Open the script and add explicit `-h|--help` handling near the top, before any argument validation that could otherwise reject `--help` as an invalid argument.
2. Print a short description, a `Usage:` line, and a list of options/arguments, then `exit 0`.
3. Follow the pattern already used by `bin/backup.sh` and `bin/sync.sh` (a `show_help` function printing a heredoc, checked for before strict argument-count/flag validation runs).
4. Re-run `--help` to confirm it now passes, then continue to Step 3 using the corrected script.

### 3. Decide what the user wants

- **No command named** (e.g. the skill is invoked with no arguments) — run discovery (Step 1) and collect help text for each script (Step 2), then present a compact catalogue: script name + the one-line description pulled from its own `--help` output. Invite the user to run a specific command, or ask for `--help` on one for full details.
- **A command named, with `--help`/`-h`, or no args when the script requires them** — show that script's full `--help` output verbatim. Do not paraphrase or summarize it.
- **A command named, with arguments to actually run it** — first verify the name matches a script discovered in Step 1 (match on basename, with or without extension). If there's no match, say so explicitly and show the current catalogue instead of guessing at a close name. If it matches, execute it exactly as requested, from the repository root, e.g. `bin/<script> <args...>`.

### 4. Workspace slug arguments

Some scripts take a workspace `<slug>` argument (visible in their `--help` output). If the user's request needs one and hasn't supplied it, resolve it the same way the Workspace Resolution section of `INSTRUCTIONS.md` describes (check `.workspace`, or ask if multiple workspaces exist) rather than guessing which workspace they mean.

### 5. Report results

After running a command, report its exit code. On failure, surface `stderr` prominently and, if the failure looks like a usage error, suggest re-running with `--help`.

## Output

None persisted by this skill directly. Whatever the invoked script itself produces is the output (e.g. `bin/backup.sh` writes a zip under `workspaces/`; `bin/sync.sh` invokes an external diff/sync tool and updates its own remembered-settings dotfile). Bin's own contribution is discovery, documentation, and safe invocation — not new files of its own.
