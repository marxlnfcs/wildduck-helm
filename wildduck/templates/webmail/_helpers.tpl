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

{{- define "webmail.ingress.hostname" }}
{{- if .Values.webmail.ingress.hostname }}
    {{- .Values.webmail.ingress.hostname }}
{{- else if .Values.common.ingressDomain }}
    {{- printf "webmail.%s" (.Values.common.ingressDomain) }}
{{- else }}
    {{- printf "webmail.%s" (.Values.common.baseDomain) }}
{{- end }}
{{- end }}

{{- define "webmail.ingress.url" }}
{{- if .Values.webmail.ingress.tls }}
{{- printf "https://%s" (include "webmail.ingress.hostname" .) }}
{{- else }}
{{- printf "http://%s" (include "webmail.ingress.hostname" .) }}
{{- end }}
{{- end }}

{{- define "webmail.ingress.tls.secret" }}
{{- if .Values.webmail.ingress.existingSecretName }}
{{ .Values.webmail.ingress.existingSecretName }}
{{- else }}
{{- include "tls.name.generate" (include "webmail.ingress.hostname" .) }}
{{- end }}
{{- end }}