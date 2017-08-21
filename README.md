# Buildkite Agent Helm Chart

The official [Buildkite Agent](https://buildkite.com/docs/agent) Charts repository for [Helm](https://helm.sh), the package manager for [Kubernetes](http://kubernetes.io).

## Getting Started

### Add Buildkite Helm chart repository:

```bash
$ helm repo add buildkite https://github.com/buildkite/helm-charts
$ helm repo update
```

### Install chart

To install the chart with the release name `bk-agent`:

```bash
$ helm install buildkite/buildkite --name bk-agent --namespace buildkite --set agent.token="BUILDKITE_AGENT_TOKEN"
```

Check Agent chart [readme](buildkite/README.md) for more customisation options.

### You’ve now got Buildkite Agents running on your Kubernetes cluster! :tada:

## Thanks :heart:

* A massive thanks to [Rimas Mocevicius](https://github.com/rimusz) for authoring these charts

## Copyright

Copyright (c) 2017 Buildkite Pty Ltd. See [LICENSE](LICENSE) for details.
