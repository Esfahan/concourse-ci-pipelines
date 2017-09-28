# concourse-ci-pipelines
A sample of pipelines.

## cli
Choose binary of fly from following site.

- https://concourse.ci/downloads.html

Install fly.

```
$ curl -L https://github.com/concourse/concourse/releases/download/v3.4.1/fly_linux_amd64 > /tmp/fly
$ sudo mv /tmp/fly /usr/local/bin/fly
$ sudo chmod 775 /usr/local/bin/fly
```

## Create a credential file
Set your git public key on credentials.yml to use key on git

~/.concourse/credentials.yml

```yaml
---
github-private-key: |
  -----BEGIN RSA PRIVATE KEY-----
  **snip**
  -----END RSA PRIVATE KEY-----
```

## Usage
Sign in to your concourse ci.

```
$ fly -t sample-app login -c http://192.168.33.10:8080
```

Check the targets.

```
$ fly targets
name         url                        team  expiry
sample-app  http://192.168.33.10:8080  main  Sat, 05 Aug 2017 03:46:25 UTC
```

set pipe-line

```
$ fly -t sample-app set-pipeline -p rails-sample -c ci/pipelines/pipeline.yml -l ~/.concourse/credentials.yml
```

unpause

```
$ fly -t sample-app unpause-pipeline -p rails-sample2
```
