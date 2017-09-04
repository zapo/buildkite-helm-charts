# Buildkite Helm Charts Repository

The official [Buildkite Agent](https://buildkite.com/docs/agent) Charts repository for [Helm](https://helm.sh), the package manager for [Kubernetes](http://kubernetes.io).

## Getting Started

### Clone Buildkite Helm chart repository:

```bash
$ git clone git@github.com:buildkite/charts.git
$ cd charts
```

### Install chart

To install chart from Helm [charts](https://github.com/kubernetes/charts) upstream with the release name `bk-agent`:
```bash
$ help repo update
$ helm install stable/buildkite --name bk-agent --namespace buildkite --set agent.token="BUILDKITE_AGENT_TOKEN"
```

Also you can install chart by cloning this repo:
```bash
$ git clone git@github.com:buildkite/charts.git
$ cd charts
```

And then install the chart with the release name `bk-agent`:

```bash
$ helm install buildkite --name bk-agent --namespace buildkite --set agent.token="BUILDKITE_AGENT_TOKEN"
```

Check Agent chart [readme](charts/buildkite/README.md) for more customisation options.

### You’ve now got Buildkite Agents running on your Kubernetes cluster! :tada:

## Thanks :heart:

* A massive thanks to [Rimas Mocevicius](https://github.com/rimusz) for authoring these charts


## Copyright

Copyright (c) 2017 Buildkite Pty Ltd. See [LICENSE](LICENSE) for details.
