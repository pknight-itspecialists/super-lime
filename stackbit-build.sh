#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e691856814bbd0019fa5aba/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e691856814bbd0019fa5aba
curl -s -X POST https://api.stackbit.com/project/5e691856814bbd0019fa5aba/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e691856814bbd0019fa5aba/webhook/build/publish > /dev/null
