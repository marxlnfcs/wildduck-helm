{{- define "mongo.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: mongo
{{- end -}}


{{- define "mongo.name" -}}
  {{- printf "%s-mongo" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "mongo.service.name" -}}
{{- if .Values.mongo.service.name -}}
    {{- .Values.mongo.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-mongo" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}

{{- define "mongo.service.name.external" -}}
{{- if .Values.mongo.service.name -}}
    {{- .Values.mongo.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-mongo.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}