package immich_server

import (
	"encoding/yaml"

	"k8s.io/api/core/v1"
)

#SecretProviderClassList: v1.#List & {
	apiVersion: "secrets-store.csi.x-k8s.io/v1"
	kind:       "SecretProviderClassList"
	items: [...{
		apiVersion: "secrets-store.csi.x-k8s.io/v1"
		kind:       "SecretProviderClass"
	}]
}

#SecretProviderClassList: items: [{
	spec: {
		provider: "vault"
		secretObjects: [{
			secretName: #Name
			type:       v1.#SecretTypeOpaque
			data: [{
				key:        "typesense-api-key"
				objectName: key
			}]
		}]
		parameters: {
			roleName:     "\(#Name)-read"
			vaultAddress: "http://vault.vault:8200"
			objects: yaml.Marshal([{
				secretPath: "secret/data/kubernetes/unwind/immich/typesense-api-key"
				objectName: "typesense-api-key"
				secretKey:  "value"
			}])
		}
	}
}]
