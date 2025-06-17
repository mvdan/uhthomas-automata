import (
	"github.com/uhthomas/automata/k8s/magiclove/cert_manager"
	"k8s.io/api/core/v1"
)

#List: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
}

_#KindWeight: {
	kind:   string | *"?"
	weight: [
		if kind == "CustomResourceDefinition" {2},
		if kind == "Namespace" {1},
		if kind == "PersistentVolume" {0},
		-1,
	][0]
}

_items: [
	cert_manager.#List.items,
]

#List
