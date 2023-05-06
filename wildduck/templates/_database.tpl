{{- define "mongo.database.wildduck" }}
{{- printf "%s" (default "wildduck" .Values.common.database.mongo.wildduck.database ) }}
{{- end }}
{{- define "mongo.database.webmail" }}
{{- printf "%s" (default "wildduck" .Values.common.database.mongo.webmail.database ) }}
{{- end }}
{{- define "mongo.database.zonemta" }}
{{- printf "%s" (default "wildduck" (index .Values.common.database.mongo "zone-mta" "database") ) }}
{{- end }}

{{- define "mongo.connection.host" }}
{{- if .Values.mongo.external.enabled }}
{{- printf "%s" (.Values.mongo.external.host) }}
{{- else }}
{{- printf "%s" (include "mongo.service.name.external" .) }}
{{- end }}
{{- end }}

{{- define "mongo.connection.port" }}
{{- if .Values.mongo.external.enabled }}
{{- printf "%s" (.Values.mongo.external.port | toString) }}
{{- else }}
{{- printf "%s" (.Values.mongo.service.port | toString) }}
{{- end }}
{{- end }}


{{- define "mongo.connection.wildduck" }}
{{- $databaseName := (include "mongo.database.wildduck" .) }}
{{- if .Values.mongo.external.enabled }}
{{- if or (.Values.common.database.mongo.wildduck.username) (.Values.common.database.mongo.wildduck.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.common.database.mongo.wildduck.username) (.Values.common.database.mongo.wildduck.password) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.external.username) (.Values.mongo.external.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.external.username) (.Values.mongo.external.password) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- end }}
{{- else }}
{{- if or (.Values.common.database.mongo.wildduck.username) (.Values.common.database.mongo.wildduck.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.common.database.mongo.wildduck.username) (.Values.common.database.mongo.wildduck.password) (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.username) (.Values.mongo.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.username) (.Values.mongo.password) (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}

{{- define "mongo.connection.webmail" }}
{{- $databaseName := (include "mongo.database.webmail" .) }}
{{- if .Values.mongo.external.enabled }}
{{- if or (.Values.common.database.mongo.webmail.username) (.Values.common.database.mongo.webmail.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.common.database.mongo.webmail.username) (.Values.common.database.mongo.webmail.password) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.external.username) (.Values.mongo.external.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.external.username) (.Values.mongo.external.password) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- end }}
{{- else }}
{{- if or (.Values.common.database.mongo.webmail.username) (.Values.common.database.mongo.webmail.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.common.database.mongo.webmail.username) (.Values.common.database.mongo.webmail.password) (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.username) (.Values.mongo.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.username) (.Values.mongo.password) (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}

{{- define "mongo.connection.zonemta" }}
{{- $databaseName := (include "mongo.database.zonemta" .) }}
{{- if .Values.mongo.external.enabled }}
{{- if or (index .Values.common.database.mongo "zone-mta" "username") (index .Values.common.database.mongo "zone-mta" "password") }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (index .Values.common.database.mongo "zone-mta" "username") (index .Values.common.database.mongo "zone-mta" "password") (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.external.username) (.Values.mongo.external.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.external.username) (.Values.mongo.external.password) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.external.host) (.Values.mongo.external.port | toString) ($databaseName) }}
{{- end }}
{{- else }}
{{- if or (index .Values.common.database.mongo "zone-mta" "username") (index .Values.common.database.mongo "zone-mta" "password") }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (index .Values.common.database.mongo "zone-mta" "username") (index .Values.common.database.mongo "zone-mta" "password") (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else if or (.Values.mongo.username) (.Values.mongo.password) }}
{{- printf "mongodb://%s:%s@%s:%s/%s" (.Values.mongo.username) (.Values.mongo.password) (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- else }}
{{- printf "mongodb://%s:%s/%s" (include "mongo.service.name.external" .) (.Values.mongo.service.port | toString) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}


{{- define "redis.database.wildduck" }}
{{- printf "%s" (default "3" .Values.common.database.redis.wildduck | toString ) }}
{{- end }}
{{- define "redis.database.webmail" }}
{{- printf "%s" (default "5" .Values.common.database.redis.webmail | toString ) }}
{{- end }}
{{- define "redis.database.rspamd" }}
{{- printf "%s" (default "4" .Values.common.database.redis.rspamd | toString ) }}
{{- end }}
{{- define "redis.database.zonemta" }}
{{- printf "%s" (default "2" (index .Values.common.database.redis "zone-mta" | toString) ) }}
{{- end }}

{{- define "redis.connection.host" }}
{{- $databaseName := (include "redis.database.wildduck" .) }}
{{- if .Values.redis.external.enabled }}
{{- printf "%s" (.Values.redis.external.host) }}
{{- else }}
{{- printf "%s" (include "redis.service.name.external" .) }}
{{- end }}
{{- end }}
{{- define "redis.connection.port" }}
{{- if .Values.redis.external.enabled }}
{{- printf "%s" (default "6379" .Values.redis.external.port) }}
{{- else }}
{{- printf "%s" (default "6379" .Values.redis.service.port) }}
{{- end }}
{{- end }}
{{- define "redis.connection.username" }}
{{- if .Values.redis.external.enabled }}
{{- printf "%s" (default "" .Values.redis.external.username) }}
{{- else }}
{{- printf "%s" ("") }}
{{- end }}
{{- end }}
{{- define "redis.connection.password" }}
{{- if .Values.redis.external.enabled }}
{{- printf "%s" (default "" .Values.redis.external.password) }}
{{- else }}
{{- printf "%s" (default "" .Values.redis.password) }}
{{- end }}
{{- end }}
{{- define "redis.connection.database.wildduck" }}
{{- printf "%s" (include "redis.database.wildduck" .) }}
{{- end }}

{{- define "redis.connection.wildduck" }}
{{- $databaseName := (include "redis.database.wildduck" .) }}
{{- if .Values.redis.external.enabled }}
{{- if or (.Values.redis.external.username) (.Values.redis.external.password) }}
{{- printf "redis://%s:%s@%s:%s/%s" (.Values.redis.external.username) (.Values.redis.external.password) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- end }}
{{- else }}
{{- if .Values.redis.password }}
{{- printf "redis://:%s@%s:%s/%s" (.Values.redis.password) (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}

{{- define "redis.connection.webmail" }}
{{- $databaseName := (include "redis.database.webmail" .) }}
{{- if .Values.redis.external.enabled }}
{{- if or (.Values.redis.external.username) (.Values.redis.external.password) }}
{{- printf "redis://%s:%s@%s:%s/%s" (.Values.redis.external.username) (.Values.redis.external.password) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- end }}
{{- else }}
{{- if .Values.redis.password }}
{{- printf "redis://:%s@%s:%s/%s" (.Values.redis.password) (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}

{{- define "redis.connection.rspamd" }}
{{- $databaseName := (include "redis.database.rspamd" .) }}
{{- if .Values.redis.external.enabled }}
{{- if or (.Values.redis.external.username) (.Values.redis.external.password) }}
{{- printf "redis://%s:%s@%s:%s/%s" (.Values.redis.external.username) (.Values.redis.external.password) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- end }}
{{- else }}
{{- if .Values.redis.password }}
{{- printf "redis://:%s@%s:%s/%s" (.Values.redis.password) (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}

{{- define "redis.connection.zonemta" }}
{{- $databaseName := (include "redis.database.zonemta" .) }}
{{- if .Values.redis.external.enabled }}
{{- if or (.Values.redis.external.username) (.Values.redis.external.password) }}
{{- printf "redis://%s:%s@%s:%s/%s" (.Values.redis.external.username) (.Values.redis.external.password) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.external.host) (.Values.redis.external.port) ($databaseName) }}
{{- end }}
{{- else }}
{{- if .Values.redis.password }}
{{- printf "redis://:%s@%s:%s/%s" (.Values.redis.password) (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- else }}
{{- printf "redis://%s:%s/%s" (include "redis.service.name.external" .) (.Values.redis.service.port) ($databaseName) }}
{{- end }}
{{- end }}
{{- end }}