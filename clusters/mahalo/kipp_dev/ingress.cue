package kipp_dev

import networkingv1 "k8s.io/api/networking/v1"

ingressList: networkingv1.#IngressList & {
	apiVersion: "v1"
	kind:       "List"
}

ingressList: items: [{
	apiVersion: "networking.k8s.io/v1"
	kind:       "Ingress"
	metadata: annotations: {
		"cert-manager.io/cluster-issuer":                      "letsencrypt"
		"nginx.ingress.kubernetes.io/proxy-body-size":         "150m"
		"nginx.ingress.kubernetes.io/proxy-request-buffering": "off"
	}
	spec: {
		ingressClassName: "nginx"
		tls: [{
			hosts: [
				"kipp.dev.6f.io",
			]
			secretName: "kipp-dev-tls"
		}]
		rules: [{
			host: "kipp.dev.6f.io"
			http: paths: [{
				pathType: "ImplementationSpecific"
				backend: service: {
					name: "kipp-dev"
					port: name: "http"
				}
			}]
		}]
	}
}]
