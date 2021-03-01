package thanos

sealed_secret: {
	apiVersion: "bitnami.com/v1alpha1"
	kind:       "SealedSecret"
	metadata: {
		name:      "thanos"
		namespace: "thanos"
	}
	spec: {
		encryptedData: "objstore.yaml": "AgCzEt6ofH600PsuywA+9eF3npthvYoq6h9PU+0ZaNtTD6shDO4oggxr4ZQJKbyIHDM/Akv72Co5d9tTlbfbeio1fozVlUSyP9YVv7gdfWJj/Gk0EarxUe+f4Av3JyQjX01AQBrAVyohafMOGUptWUwYYLmisVllNtB3LKQvsAVIwPriqMaFlFxZAJ4EWDZa7p5yHS7k4cveYFWnBZfD5GUPybhelNR3l2K4gC2y6w5B24Vcn63jzRLyMjPvfQmYi069T5bmpXCAF+t00Otyi16w1WgbJewjtP+18WzndDp4RXkwkU3u0KizcCApMsb04zX9DBO9RCqlxnFHf1zJG7tBv0SE7PyPl7DSErV9kE9QUyX5jRf4aFlHPFfTglGBCc0l8PZVb8VBJhdvfYJLaXHAzE7+N2LM7HqCFHbwycW6q4z4TOu5hO3bo1LmGV5V21Weg63DCHNlVrE2f5Q7snKXY3bjGIYZqzvhEP7xxSvtG0vNmPplFwwp7F+0/rPsJUHOA7vrSHOApELU8qlK5Fi12v0nix85zmVsxskEeAZRj2/4Qrz1K5ZPxxLHSpj+6qH0qklz2Tes3O7UILYI1ObGGfnb2o8XAscIWR8iVn2nBwP06HxcMdPxOtkui8wjw/p8CFK1TTh2e2JoeDiv2NexnWeHuXS8N9ZcsGKJ1LYFlKD5ejhaUid3xhrS8q5X7fXt3h/Mx+ij5HG6n3hFP0DMFEJUrrV9NAEFbMUGH7YVSDeC0hq8RRahGOgF7SGX26uNoqZEYsSh4FTAHXBLfD1b5n8qfslQUdekJfixuDgOf1CsEYHM3fTNI461L4h7skLc/SyPuroGYa4agHblUFVpj1CXDQO2V1pnP88AItnNCrky6dDjAgo8dz/RMB0BbX+91Ut2LQ74bmjq4NwADiE+8Jhk0jxpVSuoD+1sucxJlQ=="
		template: metadata: {
			name:      "thanos"
			namespace: "thanos"
		}
	}
}
