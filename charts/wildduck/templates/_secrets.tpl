{{- define "secret.srs" }}
{{- printf "%s" (randAlphaNum 32 | b64enc) }}
{{- end }}

{{- define "secret.zonemta" }}
{{- printf "%s" (randAlphaNum 32 | b64enc) }}
{{- end }}

{{- define "secret.webmail" }}
{{- printf "%s" (randAlphaNum 32 | b64enc) }}
{{- end }}

{{- define "secret.totp" }}
{{- printf "%s" (randAlphaNum 32 | b64enc) }}
{{- end }}