package immich_unwind

import (
	"list"

	"k8s.io/api/core/v1"
)

#Name:      "immich-unwind"
#Namespace: "backup"

#List: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{metadata: name: string | *#Name}]
}

#List: items: list.Concat(_items)

_items: [
	#IngressList.items,
	#PersistentVolumeClaimList.items,
	#ServiceList.items,
	#StatefulSetList.items,
]
