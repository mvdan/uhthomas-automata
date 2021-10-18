package cert_manager

import rbacv1 "k8s.io/api/rbac/v1"

roleList: rbacv1.#RoleList & {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleList"
	items: [...{
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "Role"
	}]
}

roleList: items: [{
	metadata: {
		name: "cert-manager-cainjector:leaderelection"
		labels: {
			app:                           "cainjector"
			"app.kubernetes.io/component": "cainjector"
			"app.kubernetes.io/instance":  "cert-manager"
			"app.kubernetes.io/name":      "cainjector"
		}
		namespace: "kube-system"
	}
	rules: [{
		apiGroups: [""]
		resourceNames: [
			"cert-manager-cainjector-leader-election",
			"cert-manager-cainjector-leader-election-core",
		]
		resources: ["configmaps"]
		verbs: ["get", "update", "patch"]
	}, {
		apiGroups: [""]
		resources: ["configmaps"]
		verbs: ["create"]
	}, {
		apiGroups: ["coordination.k8s.io"]
		resources: ["leases"]
		resourceNames: [
			"cert-manager-cainjector-leader-election",
			"cert-manager-cainjector-leader-election-core",
		]
		verbs: ["get", "update", "patch"]
	}, {
		apiGroups: ["coordination.k8s.io"]
		resources: ["leases"]
		verbs: ["create"]
	}]
}, {
	metadata: {
		name: "cert-manager:leaderelection"
		labels: {
			app:                           "cert-manager"
			"app.kubernetes.io/component": "controller"
			"app.kubernetes.io/instance":  "cert-manager"
			"app.kubernetes.io/name":      "cert-manager"
		}
		namespace: "kube-system"
	}
	rules: [{
		apiGroups: [""]
		resourceNames: ["cert-manager-controller"]
		resources: ["configmaps"]
		verbs: ["get", "update", "patch"]
	}, {
		apiGroups: [""]
		resources: ["configmaps"]
		verbs: ["create"]
	}, {
		apiGroups: ["coordination.k8s.io"]
		resources: ["leases"]
		resourceNames: ["cert-manager-controller"]
		verbs: ["get", "update", "patch"]
	}, {
		apiGroups: ["coordination.k8s.io"]
		resources: ["leases"]
		verbs: ["create"]
	}]
}, {
	metadata: {
		name: "cert-manager-webhook:dynamic-serving"
		labels: {
			app:                           "webhook"
			"app.kubernetes.io/component": "webhook"
			"app.kubernetes.io/instance":  "cert-manager"
			"app.kubernetes.io/name":      "webhook"
		}
		namespace: "cert-manager"
	}
	rules: [{
		apiGroups: [""]
		resourceNames: [ "cert-manager-webhook-ca"]
		resources: ["secrets"]
		verbs: ["get", "list", "watch", "update"]
	}, {
		apiGroups: [""]
		resources: ["secrets"]
		verbs: ["create"]
	}]
}]
