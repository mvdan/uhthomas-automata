package compact

import (
	"k8s.io/api/core/v1"
	appsv1 "k8s.io/api/apps/v1"
)

deployment: [...appsv1.#Deployment]

deployment: [{
	apiVersion: "apps/v1"
	kind:       "Deployment"
	spec: {
		revisionHistoryLimit:    5
		progressDeadlineSeconds: 120
		strategy: type: "Recreate"
		minReadySeconds: 1
		selector: matchLabels: {
			"app.kubernetes.io/name":      "thanos"
			"app.kubernetes.io/instance":  "thanos"
			"app.kubernetes.io/component": "store"
		}
		// desire is currently in charge of Thanos compact
		replicas: 0
		template: {
			metadata: {
				annotations: "prometheus.io/scrape": "true"
				labels: {
					"app.kubernetes.io/name":      "thanos"
					"app.kubernetes.io/instance":  "thanos"
					"app.kubernetes.io/component": "store"
				}
			}
			spec: {
				containers: [{
					name:  "compact"
					image: "quay.io/thanos/thanos:v0.18.0@sha256:b94171aed499b2f1f81b6d3d385e0eeeca885044c59cef28ce6a9a9e8a827217"
					ports: [{
						name:          "http"
						containerPort: 80
					}]
					args: [
						"compact",
						"-w",
						"--http-address=:80",
						"--http-grace-period=5s",
						"--objstore.config-file=/etc/secret/objstore.yaml",
						"--downsampling.disable",
						"--deduplication.replica-label=replica",
					]
					resources: {
						requests: {
							memory:              "256Mi"
							cpu:                 "50m"
							"ephemeral-storage": "10Gi"
						}
						limits: {
							memory:              "512Mi"
							cpu:                 "350m"
							"ephemeral-storage": "10Gi"
						}
					}
					volumeMounts: [{
						name:      "thanos"
						mountPath: "/etc/secret"
						readOnly:  true
					}]
					livenessProbe: {
						httpGet: {
							path: "/-/healthy"
							port: "http"
						}
						initialDelaySeconds: 5
						periodSeconds:       3
					}
					readinessProbe: {
						httpGet: {
							path: "/-/ready"
							port: "http"
						}
						initialDelaySeconds: 5
						periodSeconds:       3
					}
					imagePullPolicy: v1.#PullIfNotPresent
				}]
				volumes: [{
					name: "thanos"
					secret: secretName: "thanos"
				}]
			}
		}
	}
}]
