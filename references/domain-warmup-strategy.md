# Domain Warm-Up Strategy for Cold Outreach

## Why Use a Separate Domain

Never warm up or send cold email from your primary domain. If cold emails get flagged as spam, it burns the domain reputation — affecting transactional emails, customer replies, team comms, invoices, everything.

Primary domain = inbound + transactional only. Outbound cold = separate lookalike domains (e.g., `getclicar.com`, `tryclicar.com`).

## The Funnel

```
lookalike domain (cold outreach) → reply / book a call → primary domain (real relationship)
```

The cold domain starts conversations. The primary domain closes them. The second domain protects the first while doing the risky work.

## Automated Warm-Up Tools

| Tool | Notes |
|------|-------|
| Instantly.ai | Built-in warm-up network + cold email sending. Most popular. |
| Warmbox.ai | Standalone warm-up via SMTP/IMAP. |
| Lemwarm | Integrated into Lemlist's cold email platform. |
| Mailreach | Warm-up + deliverability monitoring. |
| Smartlead | Built-in warm-up + sending. |

## How Warm-Up Works

1. Connect email account (Google Workspace or Outlook — not free Gmail)
2. Tool sends emails to accounts in their warm-up network
3. Those accounts auto-open, reply, mark as "not spam," move to inbox
4. Volume ramps gradually (5/day → 40/day over 2-4 weeks)
5. Builds sender reputation with ESPs (Google, Microsoft)

## Prerequisites

- Google Workspace or Outlook account on the domain
- SPF, DKIM, DMARC configured in DNS — no tool fixes bad DNS
- 2-4 weeks minimum warm-up before sending cold at scale
- Keep warm-up running even after starting outbound — maintains reputation

## If a Domain Burns

Spin up a new lookalike. Primary stays clean.
