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
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

### Once Helm has been set up correctly, add the repo as follows:

```sh
  helm repo add amphitheatre https://charts.amphitheatre.app
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
amphitheatre` to see the charts.

### To install the chart with the release name `my-amphitheatre`:

```sh
  helm install my-amphitheatre amphitheatre/amphitheatre
```

The command deploys WordPress on the Kubernetes cluster in the default
configuration.

### To uninstall the chart:

```sh
  helm delete my-amphitheatre
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Documentation

- All the helm chart source code will be commited to master branch, all the
  charts will be placed under `/charts` and each chart will be  seperate with
  their own folder

- The `index.yaml` will be commited to `gh-pages` branch, which represent
  an accessible page. The helm repository required an `index.yaml` file to show
  its charts struture

- Github action is set to provide helm release automation when changes are
  commited to the main branch.

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
page](https://docs.amphitheatre.app/contributing/overview/). There you will find
instructions for sharing your feedback, building the tool locally, and
submitting pull requests to the project.

Please note that the charts within are supplied as a starting point. They are
not intended to support every possible Kubernetes configurable. The
maintainability of a chart decreases for every additional templated line. We
suggest forking the charts if you find yourself needing non-trivial
modifications.

## License

This repository's contents are licensed under the Apache License 2.0. See the
included
[LICENSE](https://github.com/amphitheatre-app/charts/blob/master/LICENSE) file
for a copy.
