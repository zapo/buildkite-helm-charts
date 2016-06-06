# Buildkite Agent Builder Private Git

This Chart provides a [Buildkite Agent](https://buildkite.com/docs/agent) Docker Builder (DIND) for running build automation tasks on private git repositories.

You must fill in `tpl/settings.toml` file with your Buildkite agent token and your private Git SSH keys, and then run `helmc install -g buildkite-agent-builder-private-git` which will generate and install the manifest file.

If you want just to generate the manifest file run `helmc generate buildkite-agent-builder-private-git` and check the file in `manifests` folder.

Note: node hosts must be make their Docker socket available at `/var/run/docker.sock`
