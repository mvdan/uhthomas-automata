package grafana_agent_operator

import rbacv1 "k8s.io/api/rbac/v1"

clusterRoleBindingList: rbacv1.#ClusterRoleBindingList & {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "ClusterRoleBindingList"
	items: [...{
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
	}]
}

clusterRoleBindingList: items: [{
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "grafana-agent-operator"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "grafana-agent-operator"
		namespace: "default"
	}]
}]
