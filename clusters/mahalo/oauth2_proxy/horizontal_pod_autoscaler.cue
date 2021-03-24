package oauth2_proxy

import autoscalingv1 "k8s.io/api/autoscaling/v1"

horizontal_pod_autoscaler: [...autoscalingv1.#HorizontalPodAutoscaler]

horizontal_pod_autoscaler: [{
	apiVersion: "autoscaling/v1"
	kind:       "HorizontalPodAutoscaler"
	spec: {
		scaleTargetRef: {
			apiVersion: "apps/v1"
			kind:       "Deployment"
			name:       "oauth2-proxy"
		}
		minReplicas:                    2
		maxReplicas:                    4
		targetCPUUtilizationPercentage: 75
	}
}]
