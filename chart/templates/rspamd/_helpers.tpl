{{- define "rspamd.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: rspamd
{{- end -}}


{{- define "rspamd.name" -}}
  {{- printf "%s-rspamd" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "rspamd.service.name" -}}
{{- if .Values.rspamd.service.name -}}
    {{- .Values.rspamd.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-rspamd" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}


{{- define "rspamd.service.name.external" -}}
{{- if .Values.rspamd.service.name -}}
    {{- .Values.rspamd.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-rspamd.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}