package query

import "k8s.io/api/core/v1"

v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{
		metadata: {
			name: "query"
			labels: "app.kubernetes.io/component": "query"
		}
	}]
}

items:
	service +
	deployment +
	horizontal_pod_autoscaler
