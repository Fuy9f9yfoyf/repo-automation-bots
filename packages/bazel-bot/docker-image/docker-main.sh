#!/bin/bash
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

git config --global user.email "bazel-bot-development[bot]@users.noreply.github.com"
git config --global user.name "Bazel Bot"

SOURCE_CLONE_ARGS=
if [[ $SOURCE_BRANCH != "" ]]
then
  SOURCE_CLONE_ARGS="-b $SOURCE_BRANCH"
fi

TARGET_CLONE_ARGS=
if [[ $TARGET_BRANCH != "" ]]
then
  TARGET_CLONE_ARGS="-b $TARGET_BRANCH"
fi

git clone https://github.com/googleapis/googleapis.git ${SOURCE_CLONE_ARGS}
git clone https://github.com/googleapis/googleapis-gen.git ${TARGET_CLONE_ARGS}

mydir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

bash -x "$mydir/generate-googleapis-gen.sh"
