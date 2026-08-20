#!/usr/bin/env bash
# Unpack a Storymap Engine export zip into this repo (keeps .github / README / scripts).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ZIP="${1:-$ROOT/storymap-export.zip}"

if [[ ! -f "$ZIP" ]]; then
  echo "Missing zip: $ZIP" >&2
  echo "Usage: ./scripts/import-export.sh [path/to/export.zip]" >&2
  exit 1
fi

TMP="$(mktemp -d)"
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

unzip -q "$ZIP" -d "$TMP"

# Support zips that wrap contents in a single top-level folder.
SRC="$TMP"
entries=("$TMP"/*)
if [[ ${#entries[@]} -eq 1 && -d "${entries[0]}" ]]; then
  SRC="${entries[0]}"
fi

if [[ ! -f "$SRC/story.json" || ! -f "$SRC/index.html" ]]; then
  echo "That zip does not look like a Storymap Engine export (need story.json and index.html)." >&2
  exit 1
fi

# Replace published site files; leave template tooling alone.
rm -rf \
  "$ROOT/css" \
  "$ROOT/js" \
  "$ROOT/images" \
  "$ROOT/maps" \
  "$ROOT/fonts" \
  "$ROOT/index.html" \
  "$ROOT/story.json" \
  "$ROOT/README.txt"

shopt -s dotglob nullglob
for item in "$SRC"/*; do
  name="$(basename "$item")"
  case "$name" in
    .git|.github|scripts|README.md|.gitignore|storymap-export.zip) continue ;;
  esac
  rm -rf "$ROOT/$name"
  cp -R "$item" "$ROOT/$name"
done

echo "Imported storymap from $(basename "$ZIP")."
echo "Preview locally with: npx --yes serve \"$ROOT\""
