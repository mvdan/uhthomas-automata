package legacybackup

import (
	"k8s.io/api/core/v1"
	batchv1 "k8s.io/api/batch/v1"
)

#JobList: batchv1.#JobList & {
	apiVersion: "batch/v1"
	kind:       "JobList"
	items: [...{
		apiVersion: "batch/v1"
		kind:       "Job"
	}]
}

#JobList: items: [{
	metadata: name: "\(#Name)-rsync"
	spec: {
		backoffLimit: 0
		template: spec: {
			volumes: [{
				name: "from"
				hostPath: path: "/dev/disk/by-id/wwn-0x5000c500cb5f5237-part2"
			}, {
				name: "to"
				persistentVolumeClaim: claimName: #Name
			}]
			containers: [{
				name:  "rsync"
				image: "ghcr.io/uhthomas/automata/rsync:{STABLE_GIT_COMMIT}"
				command: ["rsync"]
				args: ["-ahimrvz", "-info=progress2", "/data/from/", "/data/to/"]
				volumeMounts: [{
					name:      "from"
					mountPath: "/data/from"
				}, {
					name:      "to"
					mountPath: "/data/to"
				}]
				imagePullPolicy: v1.#PullIfNotPresent
				securityContext: {
					capabilities: drop: ["ALL"]
					readOnlyRootFilesystem:   true
					allowPrivilegeEscalation: false
				}
			}]
			nodeName: "talos-avz-rb5"
			securityContext: {
				runAsUser:    1000
				runAsGroup:   3000
				runAsNonRoot: true
				fsGroup:      2000
				seccompProfile: type: v1.#SeccompProfileTypeRuntimeDefault
			}
			restartPolicy: v1.#RestartPolicyNever
		}
	}
}]
