{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "flokkr.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "flokkr.fullname" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "custom.env" -}}
{{- range $key, $value := .Values.env }}
- name: {{ $key }}
  value: {{ $value }}
{{- end -}}
{{- end -}}

{{- define "prometheus.jmx" -}}
{{ if .Values.features.prometheus }}
- name: PROMETHEUSJMX_ENABLED
  value: "true"
- name: PROMETHEUSJMX_AGENTOPTS
  value: port=28942
{{ end }}
{{- end -}}


{{- define "flokkr.commonlabels" -}}
app: {{ template "flokkr.fullname" . }}
chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}
