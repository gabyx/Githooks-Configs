#!/bin/bash
# shellcheck disable=SC1090,SC1091


DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
ROOT_DIR="$DIR/../../.."
. "$ROOT_DIR/githooks/common/export-staged.sh"
. "$ROOT_DIR/githooks/common/parallel.sh"
. "$ROOT_DIR/githooks/common/configs-format.sh"
. "$ROOT_DIR/githooks/common/stage-files.sh"
. "$ROOT_DIR/githooks/common/log.sh"

assertStagedFiles || die "Could not assert staged files."

printHeader "Running hook: Prettier format ..."

assertConfigsFormatVersion "2.8.3" "3.0.0"

regex=$(getGeneralConfigsFileRegex) || die "Could not get docs file regex."
parallelForFiles formatConfigsFile \
    "$STAGED_FILES" \
    "$regex" \
    "false" || die "Configs format failed."