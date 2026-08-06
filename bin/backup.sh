#!/usr/bin/env bash
# Backs up a workspaces/<slug> folder into a timestamped zip stored under workspaces/.
# Works on macOS and WSL Ubuntu.

set -euo pipefail

show_help() {
  cat <<'EOF'
backup.sh — back up a workspaces/<slug> folder into a timestamped zip

Zips workspaces/<slug>/ (excluding .DS_Store) into
workspaces/<slug>-<YYYYmmdd-HHMMSS>.zip. Safe to run repeatedly — each run
produces a new, separately timestamped archive; nothing is overwritten.

Usage:
  bin/backup.sh <slug>
  bin/backup.sh workspaces/<slug>

Arguments:
  <slug>              Workspace slug under workspaces/ (with or without the
                       leading "workspaces/" prefix, and with or without a
                       trailing slash).

Options:
  -h, --help          Show this help and exit.

Examples:
  bin/backup.sh acme-cloud-2026
  bin/backup.sh workspaces/acme-cloud-2026
EOF
}

for arg in "$@"; do
  case "$arg" in
    -h|--help)
      show_help
      exit 0
      ;;
  esac
done

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <slug>|workspaces/<slug>  (--help for details)" >&2
  exit 1
fi

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' is not installed. Install it with 'apt install zip' (WSL/Ubuntu) or 'brew install zip' (macOS)." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
WORKSPACES_DIR="$REPO_ROOT/workspaces"

SLUG="${1%/}"
SLUG="${SLUG#workspaces/}"

if [ -z "$SLUG" ] || [ ! -d "$WORKSPACES_DIR/$SLUG" ]; then
  echo "Error: workspace '$SLUG' not found under $WORKSPACES_DIR" >&2
  exit 1
fi

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
ZIP_NAME="${SLUG}-${TIMESTAMP}.zip"

(
  cd "$WORKSPACES_DIR"
  zip -rq "$ZIP_NAME" "$SLUG" -x "*/.DS_Store"
)

echo "Backup created: $WORKSPACES_DIR/$ZIP_NAME"
