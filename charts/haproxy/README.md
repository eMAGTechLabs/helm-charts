haproxy
=======
HAProxy is a free, very fast and reliable solution offering high availability, load balancing, and proxying for TCP and HTTP-based applications


Current chart version is `0.1.0`

Source code can be found [here](https://github.com/eMAGTechLabs/helm-charts)



## Chart Values

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
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` | If the operator is installed in your cluster, set to true to create a ServiceMonitor |
| serviceMonitor.interval | string | `"15s"` |  |
| serviceMonitor.metricsPath | string | `"/metrics"` | the path where metrics can be found |
| serviceMonitor.metricsPort | string | `"metrics"` | metrics port defined in ports section. Can be name of port or port itself |
| serviceMonitor.podTargetLabels | list | `[]` |  |
| serviceMonitor.targetLabels | list | `[]` |  |
| tolerations | list | `[]` |  |
