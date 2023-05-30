package kubevirt

import rbacv1 "k8s.io/api/rbac/v1"

#RoleBindingList: rbacv1.#RoleBindingList & {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBindingList"
	items: [...{
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "RoleBinding"
	}]
}

#RoleBindingList: items: [{
	metadata: {
		name: "kubevirt-operator-rolebinding"
		labels: "kubevirt.io": ""
	}
	roleRef: {
		apiGroup: rbacv1.#ServiceAccountKind
		kind:     "Role"
		name:     "kubevirt-operator"
	}
	subjects: [{
		kind:      rbacv1.#ServiceAccountKind
		name:      "kubevirt-operator"
		namespace: #Namespace
	}]
}]
