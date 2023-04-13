{{/* vim: set filetype=mustache: */}}

{{/* ################################################################################ */}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "amphitheatre.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* ################################################################################ */}}

{{/* Expand the name of the Apiserver. */}}
{{- define "amphitheatre.apiserver.name" -}}
{{- default "amp-apiserver" .Values.apiserver.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "amphitheatre.apiserver.fullname" -}}
{{- if .Values.apiserver.fullnameOverride }}
{{- .Values.apiserver.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "amp-apiserver" .Values.apiserver.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Return the proper apiserver image name */}}
{{- define "amphitheatre.apiserver.image" -}}
{{- printf "%s/%s:%s" .Values.apiserver.image.registry .Values.apiserver.image.repository .Values.apiserver.image.tag }}
{{- end -}}

{{/* Apiserver labels */}}
{{- define "amphitheatre.apiserver.labels" -}}
helm.sh/chart: {{ include "amphitheatre.chart" . }}
{{ include "amphitheatre.apiserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Apiserver Selector labels */}}
{{- define "amphitheatre.apiserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "amphitheatre.apiserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Create the name of the service account to use */}}
{{- define "amphitheatre.apiserver.serviceAccountName" -}}
{{- if .Values.apiserver.serviceAccount.create }}
{{- default (include "amphitheatre.apiserver.fullname" .) .Values.apiserver.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.apiserver.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* ################################################################################ */}}

{{/* Expand the name of the Controllers. */}}
{{- define "amphitheatre.controllers.name" -}}
{{- default "amp-controllers" .Values.controllers.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "amphitheatre.controllers.fullname" -}}
{{- if .Values.controllers.fullnameOverride }}
{{- .Values.controllers.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "amp-controllers" .Values.controllers.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Return the proper controllers image name */}}
{{- define "amphitheatre.controllers.image" -}}
{{- printf "%s/%s:%s" .Values.controllers.image.registry .Values.controllers.image.repository .Values.controllers.image.tag }}
{{- end -}}

{{/* Controllers labels */}}
{{- define "amphitheatre.controllers.labels" -}}
helm.sh/chart: {{ include "amphitheatre.chart" . }}
{{ include "amphitheatre.controllers.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Controllers Selector labels */}}
{{- define "amphitheatre.controllers.selectorLabels" -}}
app.kubernetes.io/name: {{ include "amphitheatre.controllers.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Create the name of the service account to use */}}
{{- define "amphitheatre.controllers.serviceAccountName" -}}
{{- if .Values.controllers.serviceAccount.create }}
{{- default (include "amphitheatre.controllers.fullname" .) .Values.controllers.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.controllers.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* ################################################################################ */}}

{{/*
Create a default fully qualified app name for MySQL dependency.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "amphitheatre.mysql.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "mysql" "chartValues" .Values.mysql "context" $) -}}
{{- end -}}

{{/* Return the Database Hostname */}}
{{- define "amphitheatre.database.host" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" (include "amphitheatre.mysql.fullname" .) -}}
{{- else -}}
  {{- printf "%s" .Values.externalDatabase.host -}}
{{- end -}}
{{- end -}}

{{/* Return the Database Port */}}
{{- define "amphitheatre.database.port" -}}
{{- if .Values.mysql.enabled }}
    {{- print "3306" -}}
{{- else -}}
    {{- printf "%d" (int .Values.externalDatabase.port) -}}
{{- end -}}
{{- end -}}

{{/* Return the Database Name */}}
{{- define "amphitheatre.database.name" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.auth.database -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.database -}}
{{- end -}}
{{- end -}}

{{/* Return the Database Username */}}
{{- define "amphitheatre.database.username" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.auth.username -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.username -}}
{{- end -}}
{{- end -}}

{{/* Return the Database Secret Name */}}
{{- define "amphitheatre.database.secretName" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" (include "amphitheatre.mysql.fullname" .) -}}
{{- else -}}
    {{- printf "%s-external-db" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}
