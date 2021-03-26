package kipp

import "k8s.io/api/core/v1"

sealedSecretList: v1.#List & {
	apiVersion: "v1"
	kind:       "List"
	items: [...{
		apiVersion: "bitnami.com/v1alpha1"
		kind:       "SealedSecret"
	}]
}

sealedSecretList: items: [{
	spec: {
		encryptedData: {
			"aws-config": "AgDckvVBGde3uIfu51SgtJY7RNhh6DybBHzDHuwx3eidBxq8OGsb09/W4Od9EF61O/mrTMnRyw8I/dma4GPqxRwB2pdh0Qxc78SeH2x6K0pwUWnHCVto0bMh501fjazkVMwhE2V05+lWLEjjNWG2bOV7lSXBrb3yToNwRyQ1duUl4FUs+WRbihLOeDf84jRrzV4qBnb6btn1BFvg9e0e4JMUzxqOcSJn42Ghl4rZ4HNedvH2+O238zvGXgxGm+tkwhodZ+WCAgoU1KGZd07/SotJmX+627V1T9fuk4PSHtyw2UUueAIg+MYwXLXkXDgOT5iXcrjOIYmrIqeKzmu3wEXYcVrergBPBeJZaHu9LEsZIxpGUolEg4xjYV1WTVY2z7eR51Ru9kdsTuI3vcnGJ8FUSSHgrOr6KU/Vb15yg8el0QDOqB+e+EqEixKblo6azzeM+r3qPGUPfcGKq1xV50lQZlyvMN23DhxTGKTT4afGF712Nr3wvSR9MxMS7l7dRLNbnQxGUSll109M3YjF4cLEn7dEDcqxUeGRYJ5hm4fnhlB9H0QQhiEa6pg+msjd90MKrvciHI3XMVKX9UGLtUUWNfKY0EHxEaloKcQSsxmk12Kufx/R4mm9ad/ySNw7oW8nQNnUAzPrVelg8z1yv/SxYfYiWhcbChkMbCTMdk4eAtFV7vtBPJ5rQ2DF3YZxbiRk5OQDvYb+/OzE09uEmf/IqccJoo7b32HynfVHYsRPZUy63HxBoy34um0CL+j9DY6dhWC1LgAxKwJnKntonZF0rwxyq6J9uoCmb7JSkZiQZ/rbwjF5XORxeadfQlD5kWKTNb28YMT1HU5Dd0UVG/Z6"
			database:     "AgDNiHL1rW9VDG8CmyRthcIMNMOzCBSDPGZCd1hbXod7YOjlSoQVcF8V+thbXe4TZz5301kDxvjXPW5LBmxE45Fioiy/B1TdD3rAKFZTqpunu1ITvYp9baPXG828H6Ca4JwTqoq1389e4wobN5fAucB2pBhb+oylk4lT4V9DbN0r9rHUAWoDn4v8MVRM5YmUAyp1pD9VUdMCs1scb10lwr5FPMS2KxUe1ijszz2FQKPJ2BiHmcODfC+r1ECNADUYeyczE/a0R9nujsQNkeMfXfrTRF4KXfoHOexqdvug04lKAqVZ9wfjZuiKJqi/sdu9tOc+iz4VZQ+qK5udCkJikw88E8svOWOkXTucMMoO+S2st3qQDGiRO9kA25GpR9ZZ1CxujL+/thPiNH9fTOPWEa6OBQdbF6Eex51tYqDgL5yODWJbDtuTasSn53j96fNXhMYCKy1O+rYNvf9WWFFnIYJw8anTl4zoI9iear1eiZdADJxgTw3POEl+0GO9w9OS7MlBf1pu/LC0bknYJ6CAqJiG5/ypLxbUv0nm1r5l59skeM2H0NgQBYsTaMz3SN+cdqImXClWuQOTgFK0mMfNQSuKazQ54kfxT8P4fyMveOPU7q3G5wTwsWQbzSj8d8tGbpF3i78cDFXrMlylxzSz2KNYYlWmHffP4cSxwB7iK1GyWqVJZywbzv454Z3FacuQ+OejDI+HZ58leTOBKi7nL2if6KOvitQGDP6JHw67yAnplYbyZw5EjGdHhfcjek3CQ0qSFTkQL/poQyoQ//DczEmdUccDoybclRcCNpk="
		}
		template: metadata: {
			name:      "kipp"
			namespace: "kipp"
		}
	}
}]
