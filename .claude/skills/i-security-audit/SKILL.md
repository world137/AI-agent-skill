---
name: i-security-audit
description: Security review checklist based on OWASP Top 10 and secure coding practices — injection, auth, access control, secrets, crypto, input validation, dependencies, logging. Use when reviewing code that handles user input, authentication, authorization, data storage, file/network access, or third-party dependencies.
---

# Security Audit

## Checklist
**Input & injection**
- [ ] SQL/NoSQL: parameterized queries only, no string concatenation
- [ ] Command injection: no shell with user input; use arg arrays
- [ ] Path traversal: normalize and restrict file paths
- [ ] XSS: output encoding; no raw HTML from user data
- [ ] SSRF: allow-list outbound URLs from user input
- [ ] Deserialization of untrusted data
- [ ] Validation at every trust boundary (type, length, range, format)

**AuthN / AuthZ**
- [ ] Every endpoint/action checks authorization (incl. object-level — IDOR)
- [ ] Passwords hashed with bcrypt/argon2/scrypt; no custom crypto
- [ ] Session/JWT: expiry, signature verified, algorithm pinned, secure cookie flags
- [ ] Rate limiting on login and sensitive actions

**Data & secrets**
- [ ] No secrets/keys/tokens in code, tests, logs, or config committed to git
- [ ] Sensitive data encrypted in transit (TLS) and at rest where required
- [ ] Logs exclude passwords, tokens, PII
- [ ] Error messages don't leak stack traces/internal details to clients

**Dependencies & config**
- [ ] New dependencies: maintained, no known CVEs (run audit tool)
- [ ] Secure defaults; debug mode off in production; CORS not `*` with credentials

**Business logic**
- [ ] Race conditions (double spend, double submit), negative quantities, integer overflow
- [ ] Workflow steps can't be skipped

## Severity
CRITICAL (exploitable remotely, data breach) · HIGH · MEDIUM · LOW

For each finding include an **exploit scenario** (how an attacker would use it) and a concrete fix.
