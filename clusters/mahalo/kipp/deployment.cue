package kipp

import (
	"k8s.io/api/core/v1"
	appsv1 "k8s.io/api/apps/v1"
)

deploymentList: appsv1.#DeploymentList & {
	apiVersion: "v1"
	kind:       "List"
}

deploymentList: items: [{
	apiVersion: "apps/v1"
	kind:       "Deployment"
	spec: {
		revisionHistoryLimit:    5
		progressDeadlineSeconds: 120
		strategy: rollingUpdate: maxUnavailable: 1
		minReadySeconds: 1
		selector: matchLabels: {
			"app.kubernetes.io/name":      "kipp"
			"app.kubernetes.io/instance":  "kipp"
			"app.kubernetes.io/component": "kipp"
		}
		template: {
			metadata: {
				annotations: {
					"prometheus.io/scrape": "true"
					"prometheus.io/path":   "/varz"
				}
				labels: {
					"app.kubernetes.io/name":      "kipp"
					"app.kubernetes.io/instance":  "kipp"
					"app.kubernetes.io/component": "kipp"
				}
			}
			spec: {
				containers: [{
					name:  "kipp"
					image: "uhthomas/kipp:v0.2.1@sha256:1c1ab66793cd2232552ec3e6fe08588297cec5ed45b7de84e6a057148c874263"
					args: [
						"--database=$(DATABASE)",
						"--filesystem=s3://fr-par/kipp?endpoint=s3.fr-par.scw.cloud",
						"--lifetime=0",
					]
					ports: [{
						name:          "http"
						containerPort: 80
					}]
					env: [{
						name:  "AWS_SHARED_CREDENTIALS_FILE"
						value: "/aws-config"
					}, {
						name: "DATABASE"
						valueFrom: secretKeyRef: {
							name: "kipp"
							key:  "database"
						}
					}]
					resources: {
						requests: {
							memory: "16Mi"
							cpu:    "150m"
						}
						limits: {
							memory: "64Mi"
							cpu:    "400m"
						}
					}
					volumeMounts: [{
						name:      "secret"
						mountPath: "/aws-config"
						readOnly:  true
						subPath:   "aws-config"
					}]
					livenessProbe: {
						httpGet: {
							path: "/healthz"
							port: "http"
						}
						initialDelaySeconds: 5
						periodSeconds:       3
					}
					readinessProbe: {
						httpGet: {
							path: "/healthz"
							port: "http"
						}
						initialDelaySeconds: 5
						periodSeconds:       3
					}
					imagePullPolicy: v1.#PullIfNotPresent
				}]
				volumes: [{
					name: "secret"
					secret: secretName: "kipp"
				}]
			}
		}
	}
}]
