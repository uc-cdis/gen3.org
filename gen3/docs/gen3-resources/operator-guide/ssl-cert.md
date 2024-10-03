# SSL Certificate

   * Obtain an SSL/TLS certificate for securing your Gen3 deployment. You can use a certificate authority (CA) or use Let's Encrypt with Certbot for free certificates.
   * Ensure you have a valid domain name for your Gen3 deployment.


A certificate can be created using [Certbot][certbot]. It will ask you to create a DNS TXT record to verify domain ownership.

```
sudo certbot certonly --manual --preferred-challenges=dns -d fairtox.com
```

Complete the DNS challenge, wait for DNS (1-5 min) and then click continue.

Once you have the certificate create a kubernetes secret with it.

```
kubectl create secret tls <secret-name> --cert=<path-to-certificate.pem> --key=<path-to-key.pem>
```

We will use this secret later on in our deployment.



<!-- Links -->

[certbot]:https://certbot.eff.org
