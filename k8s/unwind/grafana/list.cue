package grafana

import "k8s.io/api/core/v1"

#Name:      "grafana"
#Namespace: #Name
#Version:   "9.3.6"

#List: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{
		metadata: {
			name:      #Name
			namespace: #Namespace
			labels: {
				"app.kubernetes.io/name":      #Name
				"app.kubernetes.io/instance":  #Name
				"app.kubernetes.io/version":   #Version
				"app.kubernetes.io/component": #Name
			}
		}
	}]
}

#List: items:
	// The namespace must be created first.
	#NamespaceList.items +
	// Lexicographic ordering.
	#ConfigMapList.items +
	#DeploymentList.items +
	#PersistentVolumeClaimList.items +
	#SecretProviderClassList.items +
	#ServiceAccountList.items +
	#ServiceList.items
