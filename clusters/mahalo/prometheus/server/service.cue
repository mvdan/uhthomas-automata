package server

import "k8s.io/api/core/v1"

service: [...v1.#Service]

service: [{
	apiVersion: "v1"
	kind:       "Service"
	metadata: name: "server"
	spec: {
		ports: [{
			name:       "http"
			port:       80
			targetPort: "http"
		}, {
			name:       "grpc"
			port:       50051
			targetPort: "thanos-grpc"
		}]
		selector: {
			"app.kubernetes.io/name":      "prometheus"
			"app.kubernetes.io/instance":  "prometheus"
			"app.kubernetes.io/component": "server"
		}
	}
}]
