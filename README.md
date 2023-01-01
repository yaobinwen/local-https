# Local HTTPS

## Hash functions

A [_hash function_](https://en.wikipedia.org/wiki/Hash_function) projects input values of **arbitrary size** to **fixed-size** output values. For example, the [modulo operation](https://en.wikipedia.org/wiki/Modulo_operation) `y = x MOD N` is a hash function because it maps any arbitrary input value `x` to a fixed-size range of values `[0, N-1]`.

When two input values are projected to the same output value, it is called a _collision_. Take the modulo operation `y = x MOD 5` for example, both `6` and `11` produce the same result `1`, so we say `6` and `11` cause a collision.

A hash function must be **deterministic**: Given the hash function `H`, one particular input value must always result in the same output value, no matter if the hash operation is done today or tomorrow, in one country or another country, by a male or a female, by a human or a monkey, etc.

When used for cryptography, a well-designed hash function must satisfy the following properties:
- 1). **Preimage resistance** (i.e., one-way or irreversible): Given the hash function `H` and the output value `y`, it should be difficult to find the input value `x` such that `y = H(x)`.
  - It is called "preimage" because there is a kind of attack called ["preimage attack"](https://en.wikipedia.org/wiki/Preimage_attack).
- 2). **Second preimage resistence** (i.e., **weak collision resistance**): Given the hash function `H` and the input value `x1`, it should be difficult to find `x2` such that `x1 ≠ x2` and `H(x1) = H(x2)`.
- 3). **Strong collision resistance**: Given the hash function `H`, it should be difficult to find any two input values `x1` and `x2` such that `x1 ≠ x2` and `H(x1) = H(x2)`.

There are many hash functions. See [_List of hash functions_](https://en.wikipedia.org/wiki/List_of_hash_functions). But not all hash functions are secure enough to be used for cryptography. See [_Hash function security summary_](https://en.wikipedia.org/wiki/Hash_function_security_summary).

## Plaintext and ciphertext

In cryptography, _plaintext_ usually means the "original message/data". Traditionally, the plaintext refers to a piece of human-readable text such as a military message, but nowadays it can refer to any form of data, human-readable or not.

_Ciphertext_ is the encrypted plaintext.

## Encryption, decryption, and cipher

In cryptography, _encryption_ is the process of converting plaintext to ciphertext, and _decryption_ is the reverse process of converting ciphertext back to plaintext. The process, usually some kind of mathematical algorithm, of encryption or decryption, is called _cipher_.

If we use `pt` to denote plaintext, `ct` for ciphertext, and `C` for the cipher, the encryption and decription can be represented by the following mathematical expressions:
- Encryption: `ct = C(pt)`
- Decryption: `pt = C⁻¹(ct)` where `C⁻¹` is the inverse function of `C`.

## Key

In order to convert plaintext to ciphertext, a cipher usually also uses a piece of auxiliary information called a _key_. It's a little bit similar to locking your cabinet: You want to protect your cabinet using a lock. The lock provides a locking mechnism but you need the key to the lock to trigger it.

The modified version of the mathematical expressions are as follows:
- Encryption: `ct = C(pt, key)`
- Decryption: `pt = C⁻¹(ct, key)`

## Symmetric cryptography and asymmetric cryptography

If a cipher encrypts and decrypts using the same key, the cipher is said to be _symmetric_; if the cipher encrypts using one key and decrypts using a different key, the cipher is said to be _asymmetric_.

The weakness of symmetric cryptography is the two parties must get the same key somehow. If the key is lost or duplicated by the malicious third party, the cabinet is no longer safe. This is the primary reason that asymmetric cryptography was developed.

Asymmetric encryption avoids the need of transferring the private key in order to make the secret really serect. It minimizes the risk of the key getting compromised.

## Digital signature

- [DocuSign: Understanding digital signatures](https://www.docusign.com/how-it-works/electronic-signature/digital-signature/digital-signature-faq)
- [CISA: Understanding Digital Signatures](https://www.cisa.gov/uscert/ncas/tips/ST04-018)

Digital signature avoids message tampering.

## RSA vs DSA

Refer to https://www.jscape.com/blog/which-works-best-for-encrypted-file-transfers-rsa-or-dsa

> ... DSA was originally intended only for signing. But now, it can be used for encrypting as well. RSA, on the other hand, has long been used for both encryption and signing.

> Here are some performance-related facts about RSA and DSA:
>
> Faster at generating keys: DSA
>
> Faster at encrypting: RSA
>
> Faster at decrypting: DSA
>
> Faster at generating a digital signature or "signing": DSA
>
> Faster at verifying a digital signature: RSA


## Certificate

Certificates prove that a particular public key truly belongs to a particular _end identity_ [1] (person or system).

[1] 3.2 lists the following types of certificates:
- CA certificates, i.e., the certificates for (root or intermediate) CAs. They can be further divided into the following sub-types:
  - Cross-certificates
  - Self-issued certificates
  - Self-signed certificates
- End entity certificates, i.e., the certificates for non-CA users (who are not authorized to issue certificates), such as an individual, a website, or an organization.

According to [1] 4.1, a certificate contains the following parts:
- Unsigned certificate
  - Certificate version
  - Certificate serial number (which can be used to revoke the certificate)
  - Signature algorithm ID
  - Issuer (i.e., CA's ID)
  - Validity (i.e., certificate expiration time)
  - Subject (i.e., end entity's name)
  - Subject's public key
  - Issuer ID (optional)
  - Subject ID (optional)
- Signature algorithm ID
- Signature by CA

The CA confirms the unsigned certificate is valid and then inputs the unsigned certificate and the CA's private key into the signature algorithm to produce the signature. Together with the CA's signature, the unsigned certificate thus becomes "signed" and can be used as a valid certificate.

Methods of getting certificates:
- CA
- Web of Trust: Implemented by PGP and GPG.
- [Simple PKI](https://world.std.com/~cme/html/spki.html)

## Certificate Chain

Every certificate (except the root CA's certificate) has four fields:
- Owner's Domain Name
- Owner's public key
- Issuer's (CA) domain name
- Issuer's (CA) signature

The issuer's domain name can be used to find the issuer's (CA) certificate. This searching can continue until arriving at the root CA. Root CA's certificate is always signed by the root CA itself and it is the end of the searching.

See the illustration from [How certificate chains work](https://www.ibm.com/docs/en/ibm-mq/9.0?topic=certificates-how-certificate-chains-work):

![How certificate chains work](https://www.ibm.com/docs/en/SSFKSJ_9.0.0/com.ibm.mq.sec.doc/q009880a.gif)

## Chain of Trust

https://en.wikipedia.org/wiki/Chain_of_trust

## Root Signing Certificates

https://aboutssl.org/root-signing-certificates/

## Types of SSL certificates

(TODO)

## Process of SSL handshake

(TODO)

## PKI

In cryptography, a PKI is an arrangement that binds public keys with respective identities of entities (like people and organizations).[1] The binding is established through a process of registration and issuance of certificates at and by a certificate authority (CA).

- https://en.wikipedia.org/wiki/Public_key_infrastructure
- https://www.keyfactor.com/resources/what-is-pki/
- https://www.securew2.com/blog/public-key-infrastructure-explained
---

CA: It is a part of the PKI (Public Key Infrastructure) with the Registration Authority (RA) who helps in verifying the information provided by the requester of a security certificate.

---

## SSL/TLS

SSL (Secure Sockets Layer)/TLS (Transport Layer Security), which require a private key and a public key.

The private key is held on the web server. The public key is embedded in the SSL certificate.

your browser will automatically download that public key along with the certificate, which confirms that the website is indeed who it presents itself to be. If there was anything that didn’t pass this exchange, the browser will give you an error warning. The browser goes through this exchange of certificates and keys in a matter of a split second.

The private key is held on the web server. That is not to be discovered by anybody other than authorized personnel on the website. The public key is distributed to you, me, everybody else at large.

This is where certificates come in to play. For Sally and Joe to know they’re actually interacting with Bob, his certificate will confirm that. The certificate is signed by a Certificate Authority like SSL.com and it will be trusted in whatever platform they’re using, in this case a browser.

## 2

https://www.baeldung.com/cs/public-private-keys-vs-certificates

we have several protocols, such as SSL/TLS, SSH, and PGP, and encryption algorithms, such as RSA and ECC, that employ asymmetric encryption as the core for security and authentication.

The most relevant regarding certificates is that they are provided by a certificate authority. So, this authority is in charge of confirming the authenticity of a certificate owner. Thus, the authority must check if the pair of public/private keys belong to a particular person or company.

- [ ] What is a hash function, anyway?
- [ ] How is signing done exactly?
- [ ] If the client and the server eventually use the symmetric encryption, how is it guaranteed that it's secure enough?


## References

- [1] [RFC 5280: Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile]

- [Ansible collection `Community.Crypto`](https://docs.ansible.com/ansible/latest/collections/community/crypto/)
  - [How to create self-signed certificates](https://docs.ansible.com/ansible/latest/collections/community/crypto/docsite/guide_selfsigned.html)
  - [How to create a small CA](https://docs.ansible.com/ansible/latest/collections/community/crypto/docsite/guide_ownca.html)

- [About SSL](https://aboutssl.org/)

TODO:
- [ ] What is modulo operation? Can it be applied to floating point numbers?
- [ ] If two private keys are different, is it guaranteed that the corresponding public keys are different, too?
- [ ] CA/Browser forum
- [ ] The root programs
- [ ] [CA/Symantec Issues](https://wiki.mozilla.org/CA/Symantec_Issues)
- [ ] Single sign-on


- [ ] https://www.keyfactor.com/resources/difference-between-root-certificates-and-intermediate-certificates/
https://support.mozilla.org/en-US/kb/secure-website-certificate
- [ ] https://www.thesslstore.com/blog/root-certificates-intermediate/
- [ ] https://en.wikipedia.org/wiki/Chain_of_trust
https://en.wikipedia.org/wiki/Root_certificate
https://www.keyfactor.com/blog/self-signed-certificate-risks/
https://www.keyfactor.com/resources/what-is-pki/
https://www.securew2.com/blog/public-key-infrastructure-explained
https://www.cloudflare.com/learning/ssl/types-of-ssl-certificates/


Private vs Public PKI
- https://www.ssl.com/article/private-vs-public-pki-building-an-effective-plan/

CT:
- https://certificate.transparency.dev/
- The Dark Side of Certificate Transparency: https://isc.sans.edu/diary/The+Dark+Side+of+Certificate+Transparency/21329
- What is Certificate Transparency?: https://www.ssl.com/faqs/questions-about-certificate-transparency/


openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
