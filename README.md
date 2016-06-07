# Buildkite Charts for Helm/Kubernetes

The official [Buildkite Agent](https://buildkite.com/docs/agent) Charts repository for [Helm Classic](https://helm.sh), the package manager for [Kubernetes](http://kubernetes.io).

## Available Charts

* [buildkite-agent](buildkite-agent) - a simple Deployment and a token secret for starting agents
* [buildkite-agent-private-git](buildkite-agent-private-git) - a Deployment and secrets with a private SSH key and token , allowing the agent to run builds from private repositories
* [buildkite-agent-builder](buildkite-agent-builder) - a simple Deployment and a token secret for starting Docker Builder (DIND) agents
* [buildkite-agent-builder-private-git](buildkite-agent-builder-private-git) - a Deployment and secrets with a private SSH key and token, allowing the Docker Builder (DIND) agent to builds from private repositories

## Getting Started

### Add these charts repository using `helmc repo add`:

```
$ helmc up
$ helmc repo add buildkite https://github.com/buildkite/helm-charts
$ helmc up
```

#### To use [buildkite-agent-private-git](buildkite-agent-private-git):

```
$ helmc fetch buildkite/buildkite-agent-private-git
```
- Update the `/Users/YOUR_USR_NAME/.helmc/workspace/charts/buildkite-agent-private-git/tpl/settings.toml` file with your BuildKite Agent token and the Github SSH key.

```
$ helmc generate buildkite-agent-private-git
$ helmc install buildkite-agent-private-git
```

#### To use [buildkite-agent-builder-private-git](buildkite-agent-builder-private-git):

```
$ helmc fetch buildkite/buildkite-agent-builder-private-git
```
- Update the `/Users/YOUR_USR_NAME/.helmc/workspace/charts/buildkite-agent-builder-private-git/tpl/settings.toml` file with your BuildKite Agent token and the Github SSH key.

```
$ helmc generate buildkite-agent-builder-private-git
$ helmc install buildkite-agent-builder-private-git
```

#### To use [buildkite-agent](buildkite-agent):

```
$ helmc fetch buildkite/buildkite-agent
```
- Update the `/Users/YOUR_USR_NAME/.helmc/workspace/charts/buildkite-agent/tpl/settings.toml` file with your BuildKite Agent token.

```
$ helmc generate buildkite-agent
$ helmc install buildkite-agent
```

#### To use [buildkite-agent-builder](buildkite-agent-builder):

```
$ helmc fetch buildkite/buildkite-agent-builder
```
- Update the `/Users/YOUR_USR_NAME/.helmc/workspace/charts/buildkite-agent-builder/tpl/settings.toml` file with your BuildKite Agent token.

```
$ helmc generate buildkite-agent-builder
$ helmc install buildkite-agent-builder
```

### You’ve now got Buildkite Agents running on your Kubernetes cluster! :tada:

## Thanks :heart:

* A massive thanks to [Rimas Mocevicius](https://github.com/rimusz) for authoring these charts

## Copyright

Copyright (c) 2016 Buildkite Pty Ltd. See [LICENSE](LICENSE) for details.
