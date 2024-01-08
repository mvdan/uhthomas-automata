package kube_system

import (
	"list"

	"k8s.io/api/core/v1"
)

#Namespace: "kube-system"

#List: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{metadata: namespace: #Namespace}]
}

#List: items: list.Concat(_items)

_items: [
	#NamespaceList.items,
	#VMServiceScrapeList.items,
]
