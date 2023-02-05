{{- define "wildduck.labels" }}
{{ include "common.labels.standard" . }}
app.kubernetes.io/component: wildduck
{{- end -}}


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

{{- define "wildduck.ingress.hostname" }}
{{- if .Values.wildduck.ingress.hostname }}
    {{- .Values.wildduck.ingress.hostname }}
{{- else if .Values.common.ingressDomain }}
    {{- printf "api.%s" (.Values.common.ingressDomain) }}
{{- else }}
    {{- printf "api.%s" (.Values.common.baseDomain) }}
{{- end }}
{{- end }}

{{- define "wildduck.ingress.url" }}
{{- if .Values.wildduck.ingress.tls }}
{{- printf "https://%s" (include "wildduck.ingress.hostname" .) }}
{{- else }}
{{- printf "http://%s" (include "wildduck.ingress.hostname" .) }}
{{- end }}
{{- end }}

{{- define "wildduck.ingress.tls.secret" }}
{{- if .Values.wildduck.ingress.existingSecretName }}
{{ .Values.wildduck.ingress.existingSecretName }}
{{- else }}
{{- include "tls.name.generate" (include "wildduck.ingress.hostname" .) }}
{{- end }}
{{- end }}