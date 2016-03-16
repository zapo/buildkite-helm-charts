# Buildkite Agent

This Chart provides a [buildkite-agent](https://buildkite.com/docs/agent) for running build automation tasks.
To be used for the private git repositories as it uses private ssh keys.

You must fill in `tpl/settings.toml` file with your BuildKite `token` and `ssh keys`.
Then run `helm install -g buildkite-agent` which will generate manifest files and
install them.

If you want just to generate the manifest files run `helm generate buildkite-agent`
and check the files in `manifests` folder.

Node hosts need to be configured to run with the Docker socket at /var/run/docker.sock 
for this chart to work properly.
