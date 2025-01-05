package external_secrets

import rbacv1 "k8s.io/api/rbac/v1"

#RoleList: rbacv1.#RoleList & {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleList"
	items: [...{
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "Role"
	}]
}

#RoleList: items: [{
	metadata: name: "external-secrets-leaderelection"
	rules: [{
		apiGroups: [""]
		resources: ["configmaps"]
		resourceNames: ["external-secrets-controller"]
		verbs: ["get", "update", "patch"]
	}, {
		apiGroups: [""]
		resources: ["configmaps"]
		verbs: ["create"]
	}, {
		apiGroups: ["coordination.k8s.io"]
		resources: ["leases"]
		verbs: ["get", "create", "update", "patch"]
	}]
}]
