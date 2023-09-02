{{/*
 * Returns the DomainName and tls name of the base domain
 */}}
{{- define "domains.baseDomain" }}
{{- printf "%s" (.Values.common.baseDomain) }}
{{- end }}
{{- define "domains.baseDomain.reversed" }}
{{- $domainBase := (include "domains.baseDomain" .) }}
{{- $domainBaseArray := splitList "." $domainBase }}
{{- $domainBaseArrayReversed := reverse $domainBaseArray }}
{{- $domainBaseReversed := join "." $domainBaseArrayReversed }}
{{- printf "%s" ($domainBaseReversed) }}
{{- end }}

{{/*
 * Returns the DomainName and tls name of the api domain
 */}}
{{- define "domains.apiDomain" }}
{{- if .Values.common.apiDomain }}
{{- printf "%s" (.Values.common.apiDomain) }}
{{- else if .Values.wildduck.ingress.hostname }}
{{- printf "%s" (.Values.wildduck.ingress.hostname) }}
{{- else }}
{{- printf "api.%s" (include "domains.baseDomain" .) }}
{{- end }}
{{- end }}
{{- define "domains.apiDomain.tls.secretName" }}
{{- printf "%s" (default (include "tls.name.generate" (include "domains.apiDomain" .)) (.Values.wildduck.ingress.existingSecretName) ) }}
{{- end }}

{{/*
 * Returns the DomainName and tls name of the mail domain
 */}}
{{- define "domains.mailDomain" }}
{{- if .Values.common.mailDomain }}
{{- printf "%s" (.Values.common.mailDomain) }}
{{- else }}
{{- printf "mail.%s" (include "domains.baseDomain" .) }}
{{- end }}
{{- end }}
{{- define "domains.mailDomain.tls.secretName" }}
{{- printf "%s" (default (include "tls.name.generate" (include "domains.mailDomain" .)) (.Values.tls.existingSecretName) ) }}
{{- end }}

{{/*
 * Returns the DomainName and tls name of the webmail domain
 */}}
{{- define "domains.webmailDomain" }}
{{- if .Values.common.webmailDomain }}
{{- printf "%s" (.Values.common.webmailDomain) }}
{{- else if .Values.webmail.ingress.hostname }}
{{- printf "%s" (.Values.webmail.ingress.hostname) }}
{{- else }}
{{- printf "webmail.%s" (include "domains.baseDomain" .) }}
{{- end }}
{{- end }}
{{- define "domains.webmailDomain.tls.secretName" }}
{{- printf "%s" (default (include "tls.name.generate" (include "domains.webmailDomain" .)) (.Values.webmail.ingress.existingSecretName) ) }}
{{- end }}

{{/*
 * Returns the DomainName and tls name of the rspamd domain
 */}}
{{- define "domains.rspamdDomain" }}
{{- if .Values.common.rspamdDomain }}
{{- printf "%s" (.Values.common.rspamdDomain) }}
{{- else if .Values.rspamd.webinterface.ingress.hostname }}
{{- printf "%s" (.Values.rspamd.webinterface.ingress.hostname) }}
{{- else }}
{{- printf "rspamd.%s" (include "domains.baseDomain" .) }}
{{- end }}
{{- end }}
{{- define "domains.rspamdDomain.tls.secretName" }}
{{- printf "%s" (default (include "tls.name.generate" (include "domains.rspamdDomain" .)) (.Values.rspamd.webinterface.ingress.existingSecretName) ) }}
{{- end }}