package grafana

import (
	appsv1 "k8s.io/api/apps/v1"
	"k8s.io/api/core/v1"
)

deploymentList: appsv1.#DeploymentList & {
	apiVersion: "apps/v1"
	kind:       "DeploymentList"
	items: [...{
		apiVersion: "apps/v1"
		kind:       "Deployment"
	}]
}

deploymentList: items: [{
	spec: {
		// TODO(thomas): Auto-scale.
		replicas: 1
		revisionHistoryLimit:    5
		progressDeadlineSeconds: 120
		strategy: rollingUpdate: maxUnavailable: 1
		minReadySeconds: 1
		selector: matchLabels: {
			"app.kubernetes.io/name":      "grafana"
			"app.kubernetes.io/instance":  "grafana"
			"app.kubernetes.io/component": "grafana"
		}
		template: {
			metadata: labels: {
				"app.kubernetes.io/name":      "grafana"
				"app.kubernetes.io/instance":  "grafana"
				"app.kubernetes.io/component": "grafana"
			}
			spec: {
				containers: [{
					name:            "grafana"
					image:           "grafana/grafana:7.5.2@sha256:b071787d69cf1e8ece704838475ffd24ccbd46fad6f0b141e5922ee8dd39c30d"
					imagePullPolicy: v1.#PullIfNotPresent
					ports: [{
						name:          "http"
						containerPort: 3000
					}]
					env: [{
						name: "GF_DEFAULT_INSTANCE_NAME"
						valueFrom: fieldRef: fieldPath: "metadata.name"
					}]
					readinessProbe: {
						failureThreshold: 3
						httpGet: {
							path: "/api/health"
							port: "http"
						}
						periodSeconds:    10
						successThreshold: 1
						timeoutSeconds:   1
					}
					volumeMounts: [{
						name:      "config"
						mountPath: "/etc/grafana/grafana.ini"
						readOnly:  true
						subPath:   "grafana.ini"
					}, {
						name:      "config"
						mountPath: "/etc/grafana/provisioning/datasources/datasources.yaml"
						readOnly:  true
						subPath:   "datasources.yaml"
					}, {
						name: "database"
						mountPath: "/etc/grafana/database"
					}]
				}]
				volumes: [{
					name: "config"
					configMap: name: "grafana"
				}, {
					name: "database"
					persistentVolumeClaim: claimName: "grafana"
				}]
			}
		}
	}
}]
