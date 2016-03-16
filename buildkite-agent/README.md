# Buildkite Agent

This Chart provides a [buildkite-agent](https://buildkite.com/docs/agent) for running build automation tasks.
To be used for the public git repositories.

You must fill in `tpl/settings.toml` file with your BuildKite `token`.
Then run `helm install -g buildkite-agent` which will generate and install the manifest file.

If you want just to generate the manifest file run `helm generate buildkite-agent`
and check the file in `manifests` folder.

Node hosts need to be configured to run with the Docker socket at /var/run/docker.sock
for this chart to work properly.
