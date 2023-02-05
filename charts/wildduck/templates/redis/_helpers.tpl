{{- define "redis.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: redis
{{- end -}}


{{- define "redis.name" -}}
  {{- printf "%s-redis" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "redis.service.name" -}}
{{- if .Values.redis.service.name -}}
    {{- .Values.redis.service.name }}
{{ else }}
    {{- printf "%s-redis" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}

{{- define "redis.service.name.external" -}}
{{- if .Values.redis.service.name -}}
    {{- .Values.redis.service.name }}
{{ else }}
    {{- printf "%s-redis.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}