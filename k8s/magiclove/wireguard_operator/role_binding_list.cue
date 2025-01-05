package wireguard_operator

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
	metadata: name: "\(#Name)-leader-election"
	roleRef: {
		apiGroup: rbacv1.#GroupName
		kind:     "Role"
		name:     "\(#Name)-leader-election"
	}
	subjects: [{
		name: #Name
		kind: rbacv1.#ServiceAccountKind
	}]
}]
