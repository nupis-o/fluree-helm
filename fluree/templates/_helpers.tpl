{{/* Generate the value entry for the fluree ledger group servers, depending on the replica count*/}}
{{- define "buildLedgerGroups" -}}
  {{ range untilStep 0 (.Values.config.replicaCount|int) 1 }}
    {{- printf "fluree-ledger-%d@fluree-ledger-%d.fluree-ledger-http-api:9790" . . -}}
    {{- if lt .  ( sub ($.Values.config.replicaCount|int) 1 ) -}}
      {{- printf "," -}}
    {{- end -}}
  {{- end }}
{{- end -}}
