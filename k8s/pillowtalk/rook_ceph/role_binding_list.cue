package rook_ceph

import rbacv1 "k8s.io/api/rbac/v1"

roleBindingList: rbacv1.#RoleBindingList & {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBindingList"
	items: [...{
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "RoleBinding"
	}]
}

roleBindingList: items: [{
	// Grant the operator, agent, and discovery agents access to resources in the namespace
	metadata: {
		name:      "rook-ceph-system"
		namespace: "rook-ceph" // namespace:operator
		labels: {
			operator:          "rook"
			"storage-backend": "ceph"
		}
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-system"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-system"
		namespace: "rook-ceph"
	}]
}, {
	// Allow the operator to create resources in this cluster's namespace
	metadata: name: "rook-ceph-cluster-mgmt"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "rook-ceph-cluster-mgmt"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-system"
		namespace: "rook-ceph"
	}]
}, {
	// Allow the osd pods in this namespace to work with configmaps
	metadata: name: "rook-ceph-osd"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-osd"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-osd"
		namespace: "rook-ceph"
	}]
}, {
	// Allow the ceph mgr to access the cluster-specific resources necessary for the mgr modules
	metadata: name: "rook-ceph-mgr"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-mgr"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-mgr"
		namespace: "rook-ceph"
	}]
}, {
	// Allow the ceph mgr to access the rook system resources necessary for the mgr modules
	metadata: name: "rook-ceph-mgr-system"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "rook-ceph-mgr-system"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-mgr"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-cmd-reporter"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-cmd-reporter"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-cmd-reporter"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-default-psp"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "psp:rook"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "default"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-osd-psp"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "psp:rook"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-osd"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-mgr-psp"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "psp:rook"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-mgr"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-cmd-reporter-psp"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "psp:rook"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-cmd-reporter"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "cephfs-csi-provisioner-role-cfg"
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-csi-cephfs-provisioner-sa"
		namespace: "rook-ceph"
	}]
	roleRef: {
		kind:     "Role"
		name:     "cephfs-external-provisioner-cfg"
		apiGroup: "rbac.authorization.k8s.io"
	}
}, {
	metadata: name: "rbd-csi-provisioner-role-cfg"
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-csi-rbd-provisioner-sa"
		namespace: "rook-ceph"
	}]
	roleRef: {
		kind:     "Role"
		name:     "rbd-external-provisioner-cfg"
		apiGroup: "rbac.authorization.k8s.io"
	}
}, {
	metadata: name: "rook-ceph-monitor"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-monitor"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "rook-ceph-system"
		namespace: "rook-ceph"
	}]
}, {
	metadata: name: "rook-ceph-metrics"
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "rook-ceph-metrics"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "prometheus"
		namespace: "prometheus"
	}]
}]
