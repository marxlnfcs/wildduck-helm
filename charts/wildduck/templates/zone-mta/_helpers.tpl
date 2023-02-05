{{- define "zonemta.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: zonemta
{{- end -}}


{{- define "zonemta.name" -}}
  {{- printf "%s-zonemta" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "zonemta.service.name" -}}
{{- if .Values.zonemta.service.name -}}
    {{- .Values.zonemta.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-zonemta" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}


{{- define "zonemta.service.name.external" -}}
{{- if .Values.zonemta.service.name -}}
    {{- .Values.zonemta.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-zonemta.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}