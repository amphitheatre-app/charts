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
 helm upgrade --install amp amphitheatre/amphitheatre --create-namespace --namespace=amp-system
```

The command deploys Amphitheatre API Server on the Kubernetes cluster in the
default configuration.

### To uninstall the chart:

```sh
  helm delete amp
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the Amphitheatre chart and their default values.

### Amphitheatre APIServer parameters

| Parameter                | Description                                                                                               | Default               |
|--------------------------|-----------------------------------------------------------------------------------------------------------|-----------------------|
| apiserver.nameOverride    | String to partially override apiserver.fullname                                                                 |                       |
| apiserver.fullnameOverride| String to partially override apiserver.fullname                                                                 |                       |
| apiserver.image.registry  | Image registry for the Amphitheatre APIServer                                                             | `ghcr.io`             |
| apiserver.image.repository| Image repository for the Amphitheatre APIServer                                                           | `amphitheatre-app/amp-apiserver` |
| apiserver.image.pullPolicy| Image pull policy for the Amphitheatre APIServer                                                           | `IfNotPresent`        |
| apiserver.imagePullSecrets| Array of imagePullSecrets for the Amphitheatre APIServer                                                    | `[]`                  |
| apiserver.replicaCount    | Number of replicas for the Amphitheatre APIServer deployment                                              | `1`                   |
| apiserver.serviceAccount.create| Specifies whether a service account should be created for the APIServer                               | `true`                |
| apiserver.serviceAccount.annotations| Annotations to add to the APIServer service account                                                      | `{}`                  |
| apiserver.serviceAccount.name| Name of the service account to use for the APIServer, generated using the fullname template if not set  | `amp-apiserver`       |
| apiserver.podAnnotations  | Annotations to add to the APIServer pods                                                                  | `{}`                  |
| apiserver.podSecurityContext| Security context for the APIServer pods                                                                 | `{}`                  |
| apiserver.securityContext.runAsNonRoot| Run the APIServer pods as a non-root user                                                             | `true`                |
| apiserver.resources       | Resource requests and limits for the APIServer pods                                                      | `{}`                  |
| apiserver.autoscaling.enabled| Enable autoscaling for the APIServer deployment                                                        | `false`               |
| apiserver.autoscaling.minReplicas| Minimum number of replicas when autoscaling is enabled                                                | `1`                   |
| apiserver.autoscaling.maxReplicas| Maximum number of replicas when autoscaling is enabled                                                | `100`                 |
| apiserver.autoscaling.targetCPUUtilizationPercentage| Target CPU utilization percentage for autoscaling                                    | `80`                  |
| apiserver.nodeSelector    | Node selector for the APIServer pods                                                                     | `kubernetes.io/os: linux` |
| apiserver.tolerations     | Tolerations for the APIServer pods                                                                        | `[]`                  |
| apiserver.affinity        | Affinity settings for the APIServer pods                                                                  | `{}`                  |
| apiserver.debug           | Enable debug mode for the APIServer                                                                       | `true`                |

### Service parameters

| Parameter           | Description                               | Default      |
|---------------------|-------------------------------------------|--------------|
| service.type        | Type of service                           | `NodePort`   |
| service.port        | Port to expose on the service             | `8170`       |
| service.nodePort    | NodePort to use (only for NodePort type)   | `31700`      |
| service.annotations | Annotations for the service                | `{}`         |
| service.labels      | Labels for the service                    | `{}`         |

### Gateway parameters

| Parameter         | Description                               | Default                |
|-------------------|-------------------------------------------|------------------------|
| gateway.enabled   | Enable the Gateway                        | `false`                |
| gateway.host      | Host for the Gateway                      | `api.amphitheatre.local` |

### Ingress parameters

| Parameter         | Description                               | Default                |
|-------------------|-------------------------------------------|------------------------|
| ingress.enabled   | Enable Ingress                            | `false`                |
| ingress.className | Ingress class name                        | `""`                   |
| ingress.annotations| Annotations for the Ingress                | `{}`                   |
| ingress.host      | Host for the Ingress                      | `api.amphitheatre.local` |
| ingress.tls       | TLS configuration for the Ingress         | `[]`                   |

### Amphitheatre Controllers parameters

| Parameter                | Description                                                                                               | Default               |
|--------------------------|-----------------------------------------------------------------------------------------------------------|-----------------------|
| controllers.nameOverride    | String to partially override controllers.fullname                                                                 |                       |
| controllers.fullnameOverride| String to partially override controllers.fullname                                                                 |                       |
| controllers.image.registry  | Image registry for the Amphitheatre Controllers                                                             | `ghcr.io`             |
| controllers.image.repository| Image repository for the Amphitheatre Controllers                                                           | `amphitheatre-app/amp-controllers` |
| controllers.image.pullPolicy| Image pull policy for the Amphitheatre Controllers                                                           | `IfNotPresent`        |
| controllers.imagePullSecrets| Array of imagePullSecrets for the Amphitheatre Controllers                                                    | `[]`                  |
| controllers.replicaCount    | Number of replicas for the Amphitheatre Controllers deployment                                              | `1`                   |
| controllers.serviceAccount.create| Specifies whether a service account should be created for the Controllers                               | `true`                |
| controllers.serviceAccount.annotations| Annotations to add to the Controllers service account                                                      | `{}`                  |
| controllers.serviceAccount.name| Name of the service account to use for the Controllers, generated using the fullname template if not set  | `amp-controllers`     |
| controllers.podAnnotations  | Annotations to add to the Controllers pods                                                                  | `{}`                  |
| controllers.podSecurityContext| Security context for the Controllers pods                                                                 | `{}`                  |
| controllers.securityContext.runAsNonRoot| Run the Controllers pods as a non-root user                                                             | `true`                |
| controllers.resources       | Resource requests and limits for the Controllers pods                                                      | `{}`                  |
| controllers.autoscaling.enabled| Enable autoscaling for the Controllers deployment                                                        | `false`               |
| controllers.autoscaling.minReplicas| Minimum number of replicas when autoscaling is enabled                                                | `1`                   |
| controllers.autoscaling.maxReplicas| Maximum number of replicas when autoscaling is enabled                                                | `100`                 |
| controllers.autoscaling.targetCPUUtilizationPercentage| Target CPU utilization percentage for autoscaling                                    | `80`                  |
| controllers.nodeSelector    | Node selector for the Controllers pods                                                                     | `kubernetes.io/os: linux` |
| controllers.tolerations     | Tolerations for the Controllers pods                                                                        | `[]`                  |
| controllers.affinity        | Affinity settings for the Controllers pods                                                                  | `{}`                  |
| controllers.debug           | Enable debug mode for the Controllers                                                                       | `true`                |

### Amphitheatre CRDs Parameters

| Parameter           | Description                               | Default      |
|---------------------|-------------------------------------------|--------------|
| crds.install        | Install or uninstall the amphitheatre-crds helm chart | `true` |

### NATS Parameters

| Parameter           | Description                               | Default      |
|---------------------|-------------------------------------------|--------------|
| nats.nats.jetstream.enabled | Enable NATS JetStream               | `true`       |
| nats.cluster.enabled       | Enable NATS Cluster                  | `true

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

Copyright (c) The Amphitheatre Authors. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
