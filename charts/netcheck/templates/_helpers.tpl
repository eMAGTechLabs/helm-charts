{{/*
Expand the name of the chart.
*/}}
{{- define "netchecker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "netchecker.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "netchecker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common server labels
*/}}
{{- define "netchecker.labels" -}}
helm.sh/chart: {{ include "netchecker.chart" . }}
{{ include "netchecker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector server labels
*/}}
{{- define "netchecker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "netchecker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common agent labels
*/}}
{{- define "netchecker.agentLabels" -}}
helm.sh/chart: {{ include "netchecker.chart" . }}
{{ include "netchecker.agentSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ print .Chart.AppVersion "-agent" | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}-agent
{{- end }}

{{/*
Selector agent labels
*/}}
{{- define "netchecker.agentSelectorLabels" -}}
app.kubernetes.io/name: {{ include "netchecker.name" . }}-agent
app: {{ include "netchecker.name" . }}-agent
app.kubernetes.io/instance: {{ .Release.Name }}-agent
{{- end }}

{{/*
Common agent in host net labels
*/}}
{{- define "netchecker.agentHostnetLabels" -}}
helm.sh/chart: {{ include "netchecker.chart" . }}
{{ include "netchecker.agentHostnetSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ print .Chart.AppVersion "-agent-hostnet" | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}-agent-hostnet
{{- end }}

{{/*
Selector agent in host net labels
*/}}
{{- define "netchecker.agentHostnetSelectorLabels" -}}
app.kubernetes.io/name: {{ include "netchecker.name" . }}-agent-hostnet
app: {{ include "netchecker.name" . }}-agent-hostnet
app.kubernetes.io/instance: {{ .Release.Name }}-agent-hostnet
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "netchecker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "netchecker.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
