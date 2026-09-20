# Merchant Onboarding &amp; KYC

A Merchant signs up, sets up its business profile, and submits KYC
documents; a Platform Admin reviews the submission before the merchant can
collect live payments.

```mermaid
sequenceDiagram
    actor Merchant
    actor Admin as Platform Admin
    participant webapp as merchant-webapp
    participant admin as admin-webapp
    participant api as payments-api
    participant auth as user-auth

    Merchant->>webapp: sign in
    webapp->>auth: authenticate
    Merchant->>webapp: complete business profile
    webapp->>api: create merchant profile
    Merchant->>webapp: submit KYC documents
    webapp->>api: submit KYC
    api-->>webapp: pending review

    Admin->>admin: sign in
    admin->>auth: authenticate
    Admin->>admin: open KYC queue
    admin->>api: list pending submissions
    alt approved
        Admin->>admin: approve
        admin->>api: review (approve)
        api-->>admin: merchant verified
    else rejected
        Admin->>admin: reject with reason
        admin->>api: review (reject)
        api-->>admin: merchant rejected
    end
```

