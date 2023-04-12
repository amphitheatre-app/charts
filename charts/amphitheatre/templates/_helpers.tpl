{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper apiserver image name
*/}}
{{- define "amphitheatre.apiserver.image" -}}
{{- printf "%s/%s:%s" .Values.apiserver.registry .Values.apiserver.repository .Values.apiserver.tag }}
{{- end -}}

{{/*
Return the proper controllers image name
*/}}
{{- define "amphitheatre.controllers.image" -}}
{{- printf "%s/%s:%s" .Values.controllers.registry .Values.controllers.repository .Values.controllers.tag }}
{{- end -}}
