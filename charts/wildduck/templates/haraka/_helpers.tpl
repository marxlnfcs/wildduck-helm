{{- define "haraka.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: haraka
{{- end -}}


{{- define "haraka.name" -}}
  {{- printf "%s-haraka" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "haraka.service.name" -}}
{{- if .Values.haraka.service.name -}}
    {{- .Values.haraka.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-haraka" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}


{{- define "haraka.service.name.external" -}}
{{- if .Values.haraka.service.name -}}
    {{- .Values.haraka.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-haraka.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}