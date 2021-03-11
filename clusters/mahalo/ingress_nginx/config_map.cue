package ingress_nginx

import "k8s.io/api/core/v1"

config_map: [...v1.#ConfigMap]

config_map: [{
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: {
		name: "ingress-nginx"
		labels: {
			"app.kubernetes.io/name":      "ingress-nginx"
			"app.kubernetes.io/instance":  "ingress-nginx"
			"app.kubernetes.io/version":   "0.44.0"
			"app.kubernetes.io/component": "controller"
		}
	}
}]
