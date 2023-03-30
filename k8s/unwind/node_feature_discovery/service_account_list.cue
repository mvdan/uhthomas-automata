package node_feature_discovery

import "k8s.io/api/core/v1"

#ServiceAccountList: v1.#ServiceAccountList & {
	apiVersion: "v1"
	kind:       "ServiceAccountList"
	items: [...{
		apiVersion: "v1"
		kind:       "ServiceAccount"
	}]
}

#ServiceAccountList: items: [{
	apiVersion: "v1"
	kind:       "ServiceAccount"
	metadata: {
		name:      "nfd-master"
		namespace: "node-feature-discovery"
	}
}, {
	apiVersion: "v1"
	kind:       "ServiceAccount"
	metadata: {
		name:      "nfd-worker"
		namespace: "node-feature-discovery"
	}
}]
