{{- define "secret.wildduck.api" }}
{{- (printf "%s-%s-wildduck-api" (.Release.Name | b64enc) (.Release.Namespace | b64enc)) | b64enc }}
{{- end }}

{{- define "secret.srs" }}
{{- (printf "%s-%s-srs" (.Release.Name | b64enc) (.Release.Namespace | b64enc)) | b64enc }}
{{- end }}

{{- define "secret.zonemta" }}
{{- (printf "%s-%s-zone-mta" (.Release.Name | b64enc) (.Release.Namespace | b64enc)) | b64enc }}
{{- end }}

{{- define "secret.webmail" }}
{{- (printf "%s-%s-webmail" (.Release.Name | b64enc) (.Release.Namespace | b64enc)) | b64enc }}
{{- end }}

{{- define "secret.totp" }}
{{- (printf "%s-%s-totp" (.Release.Name | b64enc) (.Release.Namespace | b64enc)) | b64enc }}
{{- end }}