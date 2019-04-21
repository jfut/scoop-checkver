# scoop-checkver

scoop-checkver is a container to check for new version of all apps of a bucket.

- [Docker Hub](https://hub.docker.com/r/jfut/scoop-checkver)

## Usage

Add buckets to check for new version.

```
cd /path/to
mkdir buckets

# Example 1
git clone https://github.com/jfut/scoop-jfut.git buckets/jfut

# Example 2
git clone https://github.com/<your-username>/my-bucket buckets/my-bucket

# and more...
```

### Run checkver.ps1 in all buckets

```
docker run --rm -it -v $PWD/buckets:/scoop/buckets jfut/scoop-checkver
```

### Run checkver.ps1 with autoupdate and Slack post in all buckets

- docker-compose
- environment:
  - ECHO="all"
    - all: print all (default)
    - update-only: print update only
  - AUTOUPDATE="yes"
  - GIT_USER_EMAIL="you@example.com"
  - GIT_USER_NAME="Your Name"
  - SLACK="yes"
  - SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxxxx/xxxx/xxxxx
  - SLACK_USERNAME="scoop-checkver"
  - SLACK_CHANNEL="#integ-test"
  - SLACK_ICON_EMOJI=":robot_face:"

```
cat < '_EOF_' > docker-compose.yml
version: '3'

services:
  scoop-checkver:
    image: 'jfut/scoop-checkver:latest'
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./buckets:/scoop/buckets
      #- ./bin-custom:/scoop/bin
    environment:
      - ECHO="all"
      - AUTOUPDATE="no"
      - GIT_USER_EMAIL="you@example.com"
      - GIT_USER_NAME="Your Name"
      - SLACK="no"
      - SLACK_WEBHOOK_URL=https://hooks.slack.com/services/xxxxx/xxxxx/xxxxx
      - SLACK_USERNAME="scoop-checkver"
      - SLACK_CHANNEL="#general"
      - SLACK_ICON_EMOJI=":robot_face:"
_EOF_

docker-compose up
```

## Build a docker image

Build a docker image on your host.

```
pushd docker
docker build -t scoop-checkver -f Dockerfile .
popd
```

