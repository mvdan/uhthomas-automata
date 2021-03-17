package server

import "k8s.io/api/core/v1"

v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items:      sealed_secret +
		config_map +
		persistent_volume_claim +
		service +
		deployment
}
