package query_frontend

import networkingv1 "k8s.io/api/networking/v1"

ingress: networkingv1.#Ingress & {
	apiVersion: "networking.k8s.io/v1"
	kind:       "Ingress"
	metadata: {
		name:      "query-frontend"
		namespace: "thanos"
		annotations: {
			"cert-manager.io/cluster-issuer":          "letsencrypt"
			"nginx.ingress.kubernetes.io/auth-url":    "https://sso.6f.io/oauth2/auth"
			"nginx.ingress.kubernetes.io/auth-signin": "https://sso.6f.io/oauth2/start?rd=https://$host$request_uri"
			"nginx.ingress.kubernetes.io/enable-cors": "true"
		}
	}
	spec: {
		ingressClassName: "nginx"
		tls: [{
			hosts: [
				"thanos.6f.io",
			]
			secretName: "query-frontend-tls"
		}]
		rules: [{
			host: "thanos.6f.io"
			http: paths: [{
				pathType: "ImplementationSpecific"
				backend: service: {
					name: "query-frontend"
					port: name: "http"
				}
			}]
		}]
	}
}
