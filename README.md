# Amphitheatre Helm Charts

This repository hosts official [Helm](https://helm.sh) charts for
[Amphitheatre](https://amphitheatre.app). These charts are used to deploy
Amphitheatre to Kubernetes.

[![Release
Charts](https://github.com/amphitheatre-app/charts/actions/workflows/release.yml/badge.svg)](https://github.com/amphitheatre-app/charts/actions/workflows/release.yml)
[![License](https://img.shields.io/github/license/amphitheatre-app/charts)](https://github.com/amphitheatre-app/charts/blob/master/LICENSE)
[![GitHub
contributors](https://img.shields.io/github/contributors/amphitheatre-app/charts)](https://github.com/amphitheatre-app/charts/graphs/charts)
[![GitHub
issues](https://img.shields.io/github/issues/amphitheatre-app/charts)](https://github.com/amphitheatre-app/charts/issues)

## Usage

### Pre-requisites

- Kubernetes 1.19+
- Helm 3.9.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

### Once Helm has been set up correctly, add the repo as follows:

```sh
  helm repo add amphitheatre https://charts.amphitheatre.app
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
amphitheatre` to see the charts.

### To install the chart with the release name `amp`:

```sh
  helm install amp amphitheatre/amphitheatre --create-namespace --namespace=amp-system
```

The command deploys Amphitheatre API Server on the Kubernetes cluster in the
default configuration.

### To uninstall the chart:

```sh
  helm delete amp
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Documentation

- All the helm chart source code will be committed to master branch, all the
  charts will be placed under `/charts` and each chart will be  separate with
  their own folder

- The `index.yaml` will be committed to `gh-pages` branch, which represent
  an accessible page. The helm repository required an `index.yaml` file to show
  its charts structure

- Github action is set to provide helm release automation when changes are
  committed to the main branch.

- Due to rapid churn in the Kubernetes ecosystem, charts in this repository
  assume a version of Kubernetes released in the last 12 months. This typically
  means one of the last four releases.

  Note: While these charts may work with versions of older versions of
  Kubernetes, only releases made in the last year are eligible for support.

See [Amphitheatre](https://amphitheatre.app) or the [Amphitheatre
documentation](https://docs.amphitheatre.app) site for more information.

## Contributing

If anything feels off, or if you feel that some functionality is missing, please
check out the [contributing
page](https://docs.amphitheatre.app/contributing/). There you will find
instructions for sharing your feedback, building the tool locally, and
submitting pull requests to the project.

Please note that the charts within are supplied as a starting point. They are
not intended to support every possible Kubernetes configurable. The
maintainability of a chart decreases for every additional templated line. We
suggest forking the charts if you find yourself needing non-trivial
modifications.

## License

Copyright 2023 The Amphitheatre Authors. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
