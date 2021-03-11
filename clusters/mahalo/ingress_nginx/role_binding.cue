package ingress_nginx

import rbacv1 "k8s.io/api/rbac/v1"

role_binding: [...rbacv1.#RoleBinding]

role_binding: [{
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"
	metadata: {
		name: "ingress-nginx"
		labels: {
			"app.kubernetes.io/name":      "ingress-nginx"
			"app.kubernetes.io/instance":  "ingress-nginx"
			"app.kubernetes.io/version":   "0.44.0"
			"app.kubernetes.io/component": "controller"
		}
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "ingress-nginx"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "ingress-nginx"
		namespace: "ingress-nginx"
	}]
}, {
	// Source: ingress-nginx/templates/admission-webhooks/job-patch/rolebinding.yaml
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"
	metadata: {
		name: "ingress-nginx-admission"
		labels: {
			"app.kubernetes.io/name":      "ingress-nginx"
			"app.kubernetes.io/instance":  "ingress-nginx"
			"app.kubernetes.io/version":   "0.44.0"
			"app.kubernetes.io/component": "admission-webhook"
		}
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "ingress-nginx-admission"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "ingress-nginx-admission"
		namespace: "ingress-nginx"
	}]
}]
