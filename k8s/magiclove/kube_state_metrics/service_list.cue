package kube_state_metrics

import "k8s.io/api/core/v1"

#ServiceList: v1.#ServiceList & {
	apiVersion: "v1"
	kind:       "ServiceList"
	items: [...{
		apiVersion: "v1"
		kind:       "Service"
	}]
}

#ServiceList: items: [{
	spec: {
		ports: [{
			name: "http-metrics"
			port: 8080
		}, {
			name:       "telemetry"
			port:       8081
			targetPort: "telemetry"
		}]
		selector: "app.kubernetes.io/name": #Name
		clusterIP: v1.#ClusterIPNone
	}
}]
