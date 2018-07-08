 # Varnish on Alpine in Docker

Varnish version: 5.2

### Usage

``` bash
docker run -d -p {you_host_port}:80 --env 'VCL_CONFIG={you_vcl_config_path}' furkaandogan/varnish:alpine
```

### Environment Variables


| Name          | Description | Default Value |
|:--------------|:----------|:----------|
| `VCL_CONFIG`       | The address of your vcl config file you want to use for varnish    | ./vcl/default.vcl |
| `CACHE_SIZE`       | determines the size to allocate for varnish cache  | 64m |
| `VARNISHD_PARAMS`  | used to define extra varnish options    | -p default_ttl=3600 -p default_grace=3600 -a 0.0.0.0:80 |

### Test

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/2e15ab0115fb5c736b8b)

* Run Test web project
``` bash
 cd ./test/website
 dotnet run
```

* Run varnish container
``` bash
docker run -d -p 8080:80 furkaandogan/varnish:alpine
```
