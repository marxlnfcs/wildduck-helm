{{- define "wildduck.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: wildduck
{{- end -}}

{{- define "wildduck.access.token" }}
{{- if .Values.common.wildduck.accessToken }}
{{ .Values.common.wildduck.accessToken }}
{{- else }}
{{- include "secret.wildduck.api" . }}
{{- end }}
{{- end }}


{{- define "wildduck.name" -}}
  {{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}


{{- define "wildduck.service.name" -}}
{{- if .Values.wildduck.service.name -}}
    {{- .Values.wildduck.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s" (include "common.names.fullname" .) -}}
{{ end }}
{{- end }}

{{- define "wildduck.service.name.external" -}}
{{- if .Values.wildduck.service.name -}}
    {{- .Values.wildduck.service.name | trunc 63 | trimSuffix "-" }}
{{ else }}
    {{- printf "%s.%s.svc.%s" (include "common.names.fullname" .) (.Release.Namespace) (.Values.clusterDomain) -}}
{{ end }}
{{- end }}

{{- define "wildduck.url" }}
{{- if .Values.webmail.ingress.tls }}
{{- printf "https://%s" (include "domains.apiDomain" .) }}
{{- else }}
{{- printf "http://%s" (include "domains.apiDomain" .) }}
{{- end }}
{{- end }}