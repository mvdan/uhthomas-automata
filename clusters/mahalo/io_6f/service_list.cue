package io_6f

import "k8s.io/api/core/v1"

serviceList: v1.#ServiceList & {
	apiVersion: "v1"
	kind:       "ServiceList"
	items: [...{
		apiVersion: "v1"
		kind:       "Service"
	}]
}

serviceList: items: [{
	spec: {
		ports: [{
			name:       "http"
			port:       80
			targetPort: "http"
		}]
		selector: {
			"app.kubernetes.io/name":      "io-6f"
			"app.kubernetes.io/instance":  "io-6f"
			"app.kubernetes.io/component": "io-6f"
		}
	}
}]
