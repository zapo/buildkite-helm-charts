# Buildkite Helm Charts Repository

A Buildkite Agent Charts repository for [Helm](https://helm.sh) (the package manager for [Kubernetes](http://kubernetes.io)). In these charts are a replication controller for starting and scaling your build agents, and secrets support for your Buildkite Agent token and SSH private key files.

## Getting Started

Add this repository to helm with `repo add`:

```
$ helm up
$ helm repo add buildkite https://github.com/buildkite/helm-charts
$ helm up
```

Next, fetch and install `buildkite-agent-private-git` chart which will allow you to add your secrets:

```
$ helm fetch buildkite/buildkite-agent-private-git
$ helm install buildkite-agent-private-git
```

Next, fetch and install the `buildkite-agent` chart itself:

```
$ helm fetch buildkite/buildkite-agent
$ helm install buildkite-agent
```

You’ve now got Buildkite Agents running on your Kubernetes cluster!

## Copyright

Copyright (c) 2016 Buildkite Pty Ltd. See [LICENSE](LICENSE) for details.
