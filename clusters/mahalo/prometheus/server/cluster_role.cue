package server

import rbacv1 "k8s.io/api/rbac/v1"

cluster_role: [...rbacv1.#ClusterRole]

cluster_role: [{
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRole"
	metadata: {
		name: "prometheus-server"
		labels: {
			"app.kubernetes.io/name":     "prometheus-server"
			"app.kubernetes.io/instance": "prometheus-server"
			"app.kubernetes.io/version":  "2.25.1"
		}
	}
	rules: [{
		apiGroups: [
			"extensions",
		]
		resourceNames: [
			"prometheus-server",
		]
		resources: [
			"podsecuritypolicies",
		]
		verbs: [
			"use",
		]
	}, {
		apiGroups: [
			"",
		]
		resources: [
			"nodes",
			"nodes/proxy",
			"nodes/metrics",
			"services",
			"endpoints",
			"pods",
			"ingresses",
			"configmaps",
		]
		verbs: [
			"get",
			"list",
			"watch",
		]
	}, {
		apiGroups: [
			"extensions",
			"networking.k8s.io",
		]
		resources: [
			"ingresses/status",
			"ingresses",
		]
		verbs: [
			"get",
			"list",
			"watch",
		]
	}, {
		nonResourceURLs: [
			"/metrics",
		]
		verbs: [
			"get",
		]
	}]
}]
