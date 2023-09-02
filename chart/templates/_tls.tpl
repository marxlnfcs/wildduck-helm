{{- define "tls.name.generate" }}
{{- printf "%s-tls" ( . | replace "." "-" | trim ) }}
{{- end }}