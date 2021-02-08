# eMAG TechLabs Kubernetes Helm Charts

This functionality is in beta and is subject to change.

## Charts
Please look in `/charts` directory for documentation of each chart. 
These helm chart are designed to ease installation or development of various tools.

| Chart | Type | Docker file documentation  |
|-------| -----| -------------------------- |
|[haproxy](/charts/haproxy) | application | [https://hub.docker.com/_/haproxy](https://hub.docker.com/_/haproxy) |
|[newrelic-php-daemon](/charts/newrelic-php-daemon) | application | [https://hub.docker.com/r/newrelic/php-daemon](https://hub.docker.com/r/newrelic/php-daemon) |


## How to use charts
Our charts are tested against Helm 3. We don't offer support for Helm 2.

```shell script
# add emagtechlabs repository
helm repo add emagtechlabs  https://emagtechlabs.github.io/helm-charts/

# install desired chart
helm install emagtechlabs/<chartname>
```

## Kuberenetes Versions
 | 1.12 | 1.14 | 1.16 | 1.17 | 1.18
 |------|------|------|------|------
 |:white_check_mark:|:white_check_mark:|:white_check_mark:|:white_check_mark:|:white_check_mark:|

## Repository structure
This GitHub repository contains both sources and packages for helm charts developed by emagtechlabs.

The `/charts` directory contains sources of helm charts  
The `/packages` directory contains packaged charts 
