package adya

sealed_secret: {
	apiVersion: "bitnami.com/v1alpha1"
	kind:       "SealedSecret"
	metadata: name: "adya"
	spec: {
		encryptedData: token: "AgBGnLgrZ2zpWF/T3tUqK/9QuEivpequJ3oXGPfgXy517RnH+hZuiRnUNgyB6p6SNSt1D6C6tODTJiZl3y2p2A93R+gEKX93/6P6btcHlfxztGU28Jdb5FNiD+sJAY7egKc+TInYBct2SVdDAeHKLtBU5NmMhpFtPSwMrRnVly/Hh+N/AkXapnGXrOEK5NEYgEhGHxUzxbKLQ0nRAddWHDjvNrxYXy91lLgeuxmEWoM/TW2QOSyzs4lRk/oMzVxXkOrbTx7vpQrLC8PGhVEdZjKzHLKSGTTFQieG4rTNDQ/sOGORbMTlSuZC25BoS+b3bVwzJgpjNrFJFqrYlQ+rrDGI2zcuLfwiCBwhfDrWnRJ7xuVLdqcqa35+wmM9wZqM5xmeH0+IaYoh9yzmbK7Ie0xSyeBI3ztIS7dL6U3CMW9XUGmH3+SipCanpCiyhrStr+qoltgmscaHHY1xO5c8NRX8V1wUT3y80Iy+wRvOViP1yARkqaVLZetQpTsNo5ESgdprvhVNUVa6cpqxmjIJwajbgvKjIzSFmgyLlDdX/5mC8jHr6U0XzBctUs8S507ItAaANJgtORVuxgnwib+jfs2oLX5kuTxoQH7hliOK+JOgRL5wg3HU2hFNXcapWN4Jjbyz8SW5dZ5O/CQ1r18LXdXqBoKBteEiWV4M8kHdVHcbH155l7ZH/sCj91i4bire3T1639N2woD1/cUqVe6s/g6ygYSQK3GFghbKBCL1Mr9+W34DNKvKjlJuhFbXghTdElAsu0QbpYG9tuJrj9ifAgA="
		template: {
			metadata: {
				name:      "adya"
				namespace: "adya"
			}
			type: "Opaque"
		}
	}
}
