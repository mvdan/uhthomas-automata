package query

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
	metadata: annotations: "reloader.stakater.com/auto": "true"
	spec: {
		revisionHistoryLimit:    5
		progressDeadlineSeconds: 120
		strategy: rollingUpdate: maxUnavailable: 1
		minReadySeconds: 1
		selector: matchLabels: {
			"app.kubernetes.io/name":      "thanos"
			"app.kubernetes.io/instance":  "thanos"
			"app.kubernetes.io/component": "query"
		}
		template: {
			metadata: labels: {
				"app.kubernetes.io/name":      "thanos"
				"app.kubernetes.io/instance":  "thanos"
				"app.kubernetes.io/component": "query"
			}
			spec: containers: [{
				name:  "query"
				image: "quay.io/thanos/thanos:v0.21.0@sha256:04908034d76eaf5bb90f916ade8995a5c74413c86e3c01ef141c10110830654c"
				ports: [{
					name:          "grpc"
					containerPort: 50051
				}, {
					name:          "http"
					containerPort: 80
				}]
				args: [
					"query",
					"--grpc-address=:50051",
					"--grpc-grace-period=5s",
					"--http-address=:80",
					"--http-grace-period=5s",
					"--store=dnssrv+_grpc._tcp.store",
					"--store=dnssrv+_grpc._tcp.prometheus-operated.prometheus.svc",
					"--query.replica-label=replica",
				]
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
				resources: {
					requests: {
						memory: "512Mi"
						cpu:    "1000m"
					}
					limits: {
						memory: "1Gi"
						cpu:    "2000m"
					}
				}
				imagePullPolicy: v1.#PullIfNotPresent
			}]
		}
	}
}]
