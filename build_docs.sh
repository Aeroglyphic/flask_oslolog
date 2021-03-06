#!/bin/bash -x
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SRC_BRANCH=initial
make -C docs clean
make -C docs html
git checkout gh-pages
git checkout $SRC_BRANCH docs
mv -fv docs/build/html/* ./
touch .nojekyll
rm -rf docs
git add -A
git commit -m "Generated gh-pages for `git log $SRC_BRANCH -1 --pretty=short --abbrev-commit`" && git push origin gh-pages ; git checkout $SRC_BRANCH