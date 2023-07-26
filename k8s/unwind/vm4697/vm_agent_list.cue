package vm4697

import "k8s.io/api/core/v1"

// TODO: Use generated types.
//
// https://github.com/cue-lang/cue/issues/2466
#VMAgentList: v1.#List & {
	apiVersion: "operator.victoriametrics.com/v1beta1"
	kind:       "VMAgentList"
	items: [...{
		apiVersion: "operator.victoriametrics.com/v1beta1"
		kind:       "VMAgent"
	}]
}

#VMAgentList: items: [{
	spec: {
		replicaCount: 1
		resources: limits: {
			cpu:    "1000m"
			memory: "512Mi"
		}
		securityContext: {
			runAsUser:    1000
			runAsGroup:   3000
			runAsNonRoot: true
			fsGroup:      2000
			seccompProfile: type: v1.#SeccompProfileTypeRuntimeDefault
		}
		containers: [{
			name: "vmagent"
			securityContext: {
				capabilities: drop: ["ALL"]
				readOnlyRootFilesystem:   true
				allowPrivilegeEscalation: false
			}
		}]
		scrapeInterval: "30s"
		externalLabels: cluster: "unwind"
		remoteWrite: [{url: "http://vminsert-vm4697:8480/insert/0/prometheus/api/v1/write"}]
		selectAllByDefault: true
		statefulMode:       true
		statefulStorage: volumeClaimTemplate: spec: {
			storageClassName: "rook-ceph-nvme-ec-delete-block"
			resources: requests: storage: "4Gi"
		}
	}
}]
