# Copyright 2021 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

path ?= kubernetes

all: 0-fetch-k8s 1-build-binaries 2-vagrant-up

0-fetch-k8s:
	chmod +x fetch.sh
	echo $(path)
	./fetch.sh $(path)

1-build-binaries:
	chmod +x build.sh
	./build.sh $(path)

2-vagrant-up:
	vagrant destroy -f && vagrant up

3-e2e-test:
	sonobuoy run --e2e-focus=...