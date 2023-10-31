package hubble_ui

import certmanagerv1 "github.com/cert-manager/cert-manager/pkg/apis/certmanager/v1"

#CertificateList: certmanagerv1.#CertificateList & {
	apiVersion: "cert-manager.io/v1"
	kind:       "CertificateList"
	items: [...{
		apiVersion: "cert-manager.io/v1"
		kind:       "Certificate"
	}]
}

#CertificateList: items: [{
	metadata: name: "hubble-ui-client-certs"
	spec: {
		dnsNames: ["*.hubble-ui.cilium.io"]
		secretName: "hubble-ui-client-certs"
		issuerRef: {
			kind: certmanagerv1.#IssuerKind
			name: "cilium-ca"
		}
	}
}]
