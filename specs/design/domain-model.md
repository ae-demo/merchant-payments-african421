# Domain Model

The core entities behind merchant onboarding, hosted checkout, and settlement.

```mermaid
erDiagram
    MERCHANT ||--o| KYC_SUBMISSION : submits
    MERCHANT ||--o{ PAYMENT_LINK : creates
    MERCHANT ||--o{ BANK_ACCOUNT : links
    MERCHANT ||--o{ PAYOUT : receives
    PAYMENT_LINK ||--o{ TRANSACTION : receives
    BANK_ACCOUNT ||--o{ PAYOUT : "paid to"

    MERCHANT {
        string id
        string businessName
        string email
        string phone
        string country
        string kycStatus
        decimal balance
        string currency
    }
    KYC_SUBMISSION {
        string id
        string merchantId
        string documentType
        string documentUrl
        string status
        string reviewedBy
        datetime reviewedAt
    }
    PAYMENT_LINK {
        string id
        string merchantId
        decimal amount
        string currency
        string description
        string status
        datetime expiresAt
    }
    TRANSACTION {
        string id
        string paymentLinkId
        string method
        decimal amount
        string currency
        string status
        string payerReference
        datetime completedAt
    }
    BANK_ACCOUNT {
        string id
        string merchantId
        string bankName
        string accountNumber
        string accountName
        boolean verified
    }
    PAYOUT {
        string id
        string merchantId
        string bankAccountId
        decimal amount
        string currency
        string status
        datetime initiatedAt
        datetime completedAt
    }
```

A `Merchant` submits one `KycSubmission` before it can go live, creates many
`PaymentLink`s, and each link receives `Transaction`s as customers pay it
through mobile money or card. A `Merchant` links one or more `BankAccount`s
and receives `Payout`s of its accumulated balance against one of them.