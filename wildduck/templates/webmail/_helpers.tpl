{{- define "webmail.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: webmail
{{- end -}}


{{- define "webmail.name" -}}
  {{- printf "%s-webmail" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "webmail.service.name" -}}
{{- if .Values.webmail.service.name -}}
    {{- .Values.webmail.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-webmail" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}


{{- define "webmail.service.name.external" -}}
{{- if .Values.webmail.service.name -}}
    {{- .Values.webmail.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s-webmail.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}

{{- define "webmail.url" }}
{{- if .Values.webmail.ingress.tls }}
{{- printf "https://%s" (include "domains.webmailDomain" .) }}
{{- else }}
{{- printf "http://%s" (include "domains.webmailDomain" .) }}
{{- end }}
{{- end }}