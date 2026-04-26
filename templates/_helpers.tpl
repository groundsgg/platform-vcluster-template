{{/*
Velocity component name. Derived from the Helm release so the chart stays
correct if installed under a non-standard release name (although grounds-forge
always uses release name `platform`).
*/}}
{{- define "platform-vcluster-template.velocityName" -}}
{{- printf "%s-velocity" .Release.Name -}}
{{- end -}}

{{/*
Common labels applied to every rendered resource.
*/}}
{{- define "platform-vcluster-template.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Selector labels — the subset that's stable across upgrades, used in
Deployment selectors and Service matchLabels.
*/}}
{{- define "platform-vcluster-template.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Velocity-specific component labels — stacked on top of the common labels for
resources that belong to the Velocity proxy (Deployment, Service, ConfigMap,
SA, RBAC).
*/}}
{{- define "platform-vcluster-template.velocityLabels" -}}
{{ include "platform-vcluster-template.labels" . }}
app.kubernetes.io/component: velocity
{{- end -}}

{{- define "platform-vcluster-template.velocitySelectorLabels" -}}
{{ include "platform-vcluster-template.selectorLabels" . }}
app.kubernetes.io/component: velocity
{{- end -}}

{{/*
Default-Fleet name. Used by the Fleet manifest only when defaultFleet is
enabled.
*/}}
{{- define "platform-vcluster-template.defaultFleetName" -}}
{{- printf "%s-%s" .Release.Name .Values.defaultFleet.name -}}
{{- end -}}
