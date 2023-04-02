# Helm - Wildduck
Helm chart for running wildduck in kubernetes

## What is "Wildduck"?
WildDuck is a modern mail server software for IMAP and POP3. Modern being scalable, Unicode-first, and API-controlled. This chart bundles WildDuck with Haraka and ZoneMTA to create a complete mail server.

## Status
The current tested status of the helm chart. Not everything is working so far but the status below shows what has been tested and works.
- [x] Receiving mail
- [x] Sending mail
- [x] IMAP service
- [x] IMAPS service
- [x] POP3 service
- [x] POP3S service
- [x] Inbound SMTP service
- [x] Inbound SMTPS service
- [x] Outbound SMTP service
- [x] Outbound SMTPS service

## Adding Helm Chart

```bash
$ helm repo add marxlnfcs https://marxlnfcs.github.io/charts
$ helm repo update
$ helm install wildduck marxlnfcs/wildduck
```