package home_assistant

import (
	"list"

	"k8s.io/api/core/v1"
)

#Name:      "home-assistant"
#Namespace: #Name
#Version:   "2023.3.6"

#List: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{
		metadata: {
			name:      string | *#Name
			namespace: #Namespace
			labels: {
				"app.kubernetes.io/name":    #Name
				"app.kubernetes.io/version": #Version
			}
		}
	}]
}

#List: items: list.Concat(_items)

_items: [
	#NamespaceList.items,
	#ServiceList.items,
	#StatefulSetList.items,
]
