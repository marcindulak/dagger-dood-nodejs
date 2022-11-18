# Summary

Execute [dagger.io](dagger.io) NodeJS SDK from within a "Docker outside of Docker" (DooD) container.
The purpose of this is to make the environment where dagger executes as close
as possible in the local development setup and inside of CI (github action).
It's the [running jobs in a container](https://docs.github.com/en/actions/using-jobs/running-jobs-in-a-container)
approach applied to dagger.

# Usage

See [.github/workflows](.github/workflows)
