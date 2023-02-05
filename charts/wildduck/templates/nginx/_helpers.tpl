{{- define "nginx.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: nginx
{{- end -}}


{{- define "nginx.name" -}}
  {{- printf "%s-nginx" (include "common.names.fullname" .) -}}
{{- end -}}