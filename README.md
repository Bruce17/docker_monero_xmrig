### Monero XMRig Docker

[![dockerbuild](https://github.com/Bruce17/docker_monero_xmrig/actions/workflows/docker.yml/badge.svg)](https://github.com/Bruce17/docker_monero_xmrig/actions/workflows/docker.yml)

Because `servethehome/monero_xmrig` is outdated. The benefit of this docker image is that xmrig is pre built inside the docker container and thus will start faster.

For a new xmrig just update the env `BUILD_VERSION` in the `.github/workflows/docker.yml` and file a new pull request.

### Usage
* `$username` - pool username
* `$pool` - pool address (with protocol, like `stratum+tcp://`)
* `$threads` - Number of threads to mine with (recommended is `vCPU / 2`)
* `$donate` - percentage of hash to donate to devs (not me)
* `$password` - optional for most pools
* `$coin` - which coin to mine
* `$VERSION` - XMRig version to use

```
docker run -ti --rm \
  -e username=$username \
  -e xmrpool=$pool \
  -e numthreads=$threads \
  -e startport=$port \
  -e donate=$donate \
  -e coin=$coin \
  -e VERSION=$VERSION \
  hansdampf17/monero_xmrig:master
```

### Variable Defaults
* `$threads` - output of `nproc / 2`
* `$port` - `3333`
* `$xmrpool` - `stratum+tcp://pool.supportxmr.com`
* `$password` - `docker`
* `$donate` - `5`
* `$coin` - `monero`
* `$VERSION` - Current XMRig version listed above
