package vector

import corev1 "k8s.io/api/core/v1"

namespace: [...corev1.#Namespace]

namespace: [{
	apiVersion: "v1"
	kind:       "Namespace"
	metadata: name: "vector"
}]
