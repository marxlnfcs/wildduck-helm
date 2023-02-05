{{- define "tls.name.generate" }}
{{- printf "%s-tls" ( . | replace "." "-" | trim ) }}
{{- end }}

{{- define "tls.name.baseDomain" }}
{{- if .Values.tls.existingSecretName }}
{{ .Values.tls.existingSecretName }}
{{- else }}
{{- include "tls.name.generate" (.Values.common.baseDomain) }}
{{- end }}
{{- end }}