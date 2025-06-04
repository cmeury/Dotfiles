#!/usr/bin/env bash
set -euo pipefail

# go to root level
PROJECT_DIR="$(git rev-parse --show-toplevel)"
pushd $PROJECT_DIR

echo "+++ Paths in last commit:"
git diff HEAD~1 --name-only 

echo "+++ Running update-helm-dependencies on deduplicated paths..."
git diff HEAD~1 --name-only | grep ^systems | awk -F/ '{print $5}' | sort -u | xargs -I{} find systems/ -path "*/{}/*" -name "Chart.yaml" -print0 | xargs -0 -n1 bash -c 'tools/airlock/update-helm-dependencies.sh -r true -f $(dirname $0)'

echo "+++ Running sync environments"
sync-environments.sh

echo "+++ Ammend Git Commit"
git commit --amend -a

echo "+++ Showing last commit"
git show HEAD


# return to previous directory
popd
