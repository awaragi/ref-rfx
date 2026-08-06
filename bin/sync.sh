#!/usr/bin/env bash
# Syncs workspaces/<slug> against an external shared folder using a configurable
# diff/sync tool (rsync, meld, unison, code --diff, etc).
#
# Remembers the last --target and --tool used per workspace in a
# .<slug>-sync dotfile under workspaces/, next to (but outside) the
# workspace folder itself, so it never gets swept up when the workspace
# is synced or shared. Later runs can omit flags already set.
#
# Usage: bin/sync.sh <slug>|workspaces/<slug> [--target <path>] [--tool "<command>"]

set -euo pipefail

usage() {
  echo "Usage: $0 <slug>|workspaces/<slug> [--target <path>] [--tool \"<command>\"]  (--help for details)" >&2
  exit 1
}

show_help() {
  cat <<'EOF'
sync.sh — sync a workspaces/<slug> folder against an external shared folder

Runs a configurable diff/sync tool (rsync, meld, unison, code --diff, etc.)
between workspaces/<slug>/ and an external --target folder. Remembers the
last --target and --tool used per workspace in a workspaces/.<slug>-sync
dotfile, kept outside the workspace folder itself so it never gets swept
up when the workspace is zipped or shared. Later runs can omit flags
already remembered.

Usage:
  bin/sync.sh <slug>|workspaces/<slug> [--target <path>] [--tool "<command>"]

Arguments:
  <slug>              Workspace slug under workspaces/ (with or without the
                       leading "workspaces/" prefix, and with or without a
                       trailing slash).

Options:
  --target <path>     External folder to sync against. Required on first
                       run for this slug; remembered after that.
  --tool "<command>"  Sync/diff command to run, invoked as:
                         <command> <workspace-dir> <target-dir>
                       e.g. "rsync -av", "unison", "code --diff".
                       Required on first run for this slug; remembered
                       after that.
  -h, --help          Show this help and exit.

Examples:
  bin/sync.sh acme-cloud-2026 --target ~/Dropbox/acme --tool "rsync -av"
  bin/sync.sh acme-cloud-2026            # reuses remembered target/tool
EOF
}

if [ "$#" -lt 1 ]; then
  usage
fi

SLUG=""
TARGET=""
TOOL=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target)
      [ "$#" -ge 2 ] || usage
      TARGET="$2"
      shift 2
      ;;
    --target=*)
      TARGET="${1#--target=}"
      shift
      ;;
    --tool)
      [ "$#" -ge 2 ] || usage
      TOOL="$2"
      shift 2
      ;;
    --tool=*)
      TOOL="${1#--tool=}"
      shift
      ;;
    -h|--help)
      show_help
      exit 0
      ;;
    *)
      if [ -n "$SLUG" ]; then
        echo "Error: unexpected argument '$1'" >&2
        usage
      fi
      SLUG="$1"
      shift
      ;;
  esac
done

[ -n "$SLUG" ] || usage

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
WORKSPACES_DIR="$REPO_ROOT/workspaces"

SLUG="${SLUG%/}"
SLUG="${SLUG#workspaces/}"

WORKSPACE_DIR="$WORKSPACES_DIR/$SLUG"
if [ -z "$SLUG" ] || [ ! -d "$WORKSPACE_DIR" ]; then
  echo "Error: workspace '$SLUG' not found under $WORKSPACES_DIR" >&2
  exit 1
fi

SYNC_FILE="$WORKSPACES_DIR/.${SLUG}-sync"

SYNC_TARGET=""
SYNC_TOOL=""
if [ -f "$SYNC_FILE" ]; then
  # shellcheck disable=SC1090
  source "$SYNC_FILE"
fi

[ -n "$TARGET" ] && SYNC_TARGET="$TARGET"
[ -n "$TOOL" ] && SYNC_TOOL="$TOOL"

if [ -z "$SYNC_TARGET" ]; then
  echo "Error: no sync target remembered for '$SLUG' yet. Pass --target <path>." >&2
  exit 1
fi
if [ -z "$SYNC_TOOL" ]; then
  echo "Error: no sync tool remembered for '$SLUG' yet. Pass --tool \"<command>\"." >&2
  exit 1
fi

if [ -d "$SYNC_TARGET" ]; then
  SYNC_TARGET="$(cd "$SYNC_TARGET" && pwd)"
else
  echo "Warning: target '$SYNC_TARGET' does not exist yet." >&2
fi

{
  echo "SYNC_TARGET=\"$SYNC_TARGET\""
  echo "SYNC_TOOL=\"$SYNC_TOOL\""
} > "$SYNC_FILE"

echo "Syncing workspace '$SLUG'"
echo "  workspace: $WORKSPACE_DIR"
echo "  target:    $SYNC_TARGET"
echo "  tool:      $SYNC_TOOL"

read -ra TOOL_CMD <<< "$SYNC_TOOL"
"${TOOL_CMD[@]}" "$WORKSPACE_DIR" "$SYNC_TARGET"
