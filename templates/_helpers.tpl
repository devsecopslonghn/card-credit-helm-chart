{{- define "card-credit.labels" -}}
app.kubernetes.io/name: card-credit
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

