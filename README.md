# Buildkite Helm Charts Repository

A Buildkite Agent Charts repository for [Helm](https://helm.sh) (the package manager for [Kubernetes](http://kubernetes.io)). In these charts are a replication controller for starting and scaling your build agents, and secrets support for your Buildkite Agent token and SSH private key files.

## Available Charts

* [buildkite/buildkite-agent](buildkite-agent) - a simple replication controller for starting agents
* [buildkite/buildkite-agent-private-git](buildkite-agent-private-git) - a replication controller and secrets with a private SSH key, allowing the agent to run builds from private repositories

## Getting Started

Add this charts repository using `helm repo add`:

```
$ helm up
$ helm repo add buildkite https://github.com/buildkite/helm-charts
$ helm up
```

To use [buildkite/buildkite-agent-private-git](buildkite-agent-private-git):

```
$ helm fetch buildkite/buildkite-agent-private-git
$ helm install buildkite-agent-private-git
```

To use [buildkite/buildkite-agent](buildkite-agent):

```
$ helm fetch buildkite/buildkite-agent
$ helm install buildkite-agent
```

You’ve now got Buildkite Agents running on your Kubernetes cluster! :tada:

## Copyright

Copyright (c) 2016 Buildkite Pty Ltd. See [LICENSE](LICENSE) for details.
