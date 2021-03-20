package tesla_exporter

import "k8s.io/api/core/v1"

v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{
		metadata: {
			name:      "tesla-exporter"
			namespace: "tesla-exporter"
			labels: {
				"app.kubernetes.io/name":      "tesla-exporter"
				"app.kubernetes.io/instance":  "tesla-exporter"
				"app.kubernetes.io/version":   "0.7.0"
				"app.kubernetes.io/component": "tesla-exporter"
			}
		}
	}]
}

items:
	namespace +
	sealed_secret +
	deployment
