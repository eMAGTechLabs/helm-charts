haproxy
=======
HAProxy is a free, very fast and reliable solution offering high availability, load balancing, and proxying for TCP and HTTP-based applications

Source code can be found [here](https://github.com/eMAGTechLabs/helm-charts)

## How to use it
```shell script
# add emagtechlabs repository
helm repo add emagtechlabs  https://emagtechlabs.github.io/helm-charts/

# install haproxy chart
helm install emagtechlabs/haproxy
```

## Prerequisites
- Helm v3
- Kubernetes 1.12+
- haproxy 2.1


| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| configFiles | object | `{"global.cfg": {}, "defaults.cfg": {}, "metrics.cfg": {}}` | List of haproxy config files |
| fullnameOverride | string | `""` |  |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"haproxy"}` | docker image to be used |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.enabled | bool | `false` | Enable ingress for stats interface |
| ingress.host | string | `"host.example.com"` |  |
| ingress.path | string | `"/"` |  |
| ingress.port | string | `"metrics"` | usually stats port should be exposed |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports | object | `{"metrics":{"containerPort":8404,"protocol":"TCP"}}` | Every port that should be exposed to others apps should be listed here |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` | Number of pods to be deployed |
| resources | object | `{}` | resource limits and request for container |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.clusterIP | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` | If the operator is installed in your cluster, set to true to create a ServiceMonitor |
| serviceMonitor.interval | string | `"15s"` |  |
| serviceMonitor.metricsPath | string | `"/metrics"` | the path where metrics can be found |
| serviceMonitor.metricsPort | string | `"metrics"` | metrics port defined in ports section. Can be name of port or port itself |
| serviceMonitor.podTargetLabels | list | `[]` |  |
| serviceMonitor.targetLabels | list | `[]` |  |
| tolerations | list | `[]` |  |


## Default configuration
Default configuration for haproxy:
```yaml
configFiles:
  global.cfg: |-
    global
      maxconn   10000
      log       127.0.0.1 local0
      nbproc    1
      nbthread  1

  defaults.cfg: |-
    defaults
      backlog   2000
      timeout   connect 10s
      timeout   client 30s
      timeout   server 30s
      timeout   check 10s
      log       global
      mode      tcp
      option    httplog
      maxconn   3000

  metrics.cfg: |-
    frontend metrics
      mode          http
      log           global
      maxconn       10
      bind          *:8404
      option        http-use-htx
      http-request  use-service prometheus-exporter if { path /metrics }
      stats         enable
      stats         uri /
      stats         refresh 10s
      stats         admin if LOCALHOST
```
