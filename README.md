# testing-docker-image
POC of how to test your docker image in the build phase.
The following testing use cases are included:

1. UT for bash scripts included in the image
2. Arbitrary test cases using a running container
3. Validity of the structure of the docker image (files, environment, metadata)

The orchestration of the containers is done using a Maven plugin: [docker-maven-plugin][docker-maven-plugin]

## Testing frameworks

The following testing frameworks are used:
1. [Bash Automated Testing System: bats-core][bats-core]
2. [Container structure tests][container-structure-test]

## Known issues
Docker logs are printed to stdout several times, the [logging][fabric8-logging] parameters of logging seems not working

## Requirements
1. maven 3.5
2. docker

## Quick start
```
git clone https://github.com/camilocot/testing-docker-image
mvn clean install
```

[bats-core]: https://github.com/bats-core/bats-core
[container-structure-test]: https://github.com/GoogleContainerTools/container-structure-test
[fabric8-logging]: https://dmp.fabric8.io/#start-logging
[docker-maven-plugin]:https://dmp.fabric8.io
