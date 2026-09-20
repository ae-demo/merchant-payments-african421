# Merchant Payments Africa — PRD

## Problem Statement

Small and medium merchants across African markets struggle to accept digital
payments from customers today. Card infrastructure is thin, most customers pay
day-to-day with mobile money, and the tools that do exist rarely support both
mobile money and card in one place. Merchants are left juggling multiple apps,
manual reconciliation in notebooks or spreadsheets, and unpredictable delays
getting collected funds into their bank accounts — all of which costs them
sales and trust.

## Solution

A merchant payments platform where a business signs up, gets verified, and
generates a payment link for any amount it wants to collect. The merchant
shares that link with a customer, who pays it with mobile money or a card on a
hosted checkout page — no account needed on the customer's side. The merchant
tracks every payment in one dashboard and receives its collected funds as
payouts to a linked bank account.

## Actors

- **Merchant** — a verified business that signs in to the platform, creates
payment links/invoices, tracks payment status and transaction history, links
a bank account, and views payouts and balance.
- **Customer (Payer)** — the person paying a merchant's payment link with
mobile money or a card; never creates a platform account.
- **Platform Admin** — reviews and approves/rejects merchant KYC submissions,
monitors merchants and transaction/payout activity across the platform, and
handles payout or dispute issues that need manual attention.

## User Stories

1. As a Merchant, I want to sign up with my business details, so that I can start onboarding onto the platform.
2. As a Merchant, I want to submit KYC/verification documents, so that I can be approved to collect live payments.
3. As a Platform Admin, I want to review and approve or reject merchant KYC submissions, so that only legitimate businesses can collect payments.
4. As a Merchant, I want to create a payment link for a specific amount and description, so that I can request payment from a customer.
5. As a Merchant, I want to copy or share a payment link, so that I can send it to a customer through whatever channel I already use.
6. As a Customer, I want to pay a merchant's payment link using mobile money, so that I can complete my purchase without a card.
7. As a Customer, I want to pay a merchant's payment link using a card, so that I can complete my purchase.
8. As a Customer, I want to see clear confirmation once my payment succeeds (or a clear reason when it fails), so that I know whether my purchase went through.
9. As a Merchant, I want to see the live status of each payment link (pending, paid, expired, failed), so that I know when a customer has paid.
10. As a Merchant, I want to view a history of all my transactions, so that I can track my sales over time.
11. As a Merchant, I want to link my bank account, so that I can receive payouts of my collected funds.
12. As a Merchant, I want to receive payouts of my available balance to my linked bank account, so that I can access the money I've collected.
13. As a Merchant, I want to view my payout history and current balance, so that I can reconcile my funds.
14. As a Platform Admin, I want to view all merchants and their transaction and payout activity, so that I can monitor the platform for issues.
15. As a Platform Admin, I want to see and act on failed payouts or flagged transactions, so that merchant issues get resolved.

## Product Decisions

- **Sign-in**: Merchants and Platform Admins sign in via SSO through Thunder,
the platform IDP (organization default). Customers/Payers never sign in —
paying a link is a guest action tied only to that link. *assumed*
- **Merchant onboarding**: self-service signup followed by a KYC verification
step; a merchant cannot collect live payments until a Platform Admin
approves its submission.
- **Mobile money collection**: required capability; the specific mobile money
network/aggregator (e.g. covering providers like M-Pesa, MTN MoMo, Airtel
Money) is chosen at design time, not here.
- **Card payment collection**: required capability; the specific card payment
processor is chosen at design time, not here.
- **Settlement/payout**: collected funds accumulate as a merchant balance and
are paid out to the merchant's linked bank account; the payout rail/provider
is chosen at design time.
- **Payout schedule**: payouts run on a regular automatic schedule (e.g.
daily) rather than purely on-demand. *assumed*
- **Notifications**: merchants and customers are notified of payment outcomes
by email. *assumed*
- **Currency**: each payment is collected and reported in the local currency
of the country the merchant operates in; no cross-currency conversion in
this project. *assumed*
- **KYC review**: verification is a manual review by a Platform Admin against
submitted business/identity documents, not an automated check. *assumed*

## Out of Scope

- Embedding the platform's payment capability via API/SDK into a merchant's
own website or app — this project is a hosted checkout only.
- In-person/POS collection (tap-to-pay hardware, merchant-held card readers).
- Recurring billing or subscriptions — every payment link is a one-off amount.
- Cross-currency conversion / multi-currency settlement.
- Full dispute/chargeback workflows beyond an admin being able to see and flag
a failed payout or transaction.

## Open Questions

1. Which African countries and mobile money networks must be supported at
 launch (e.g. M-Pesa in Kenya, MTN MoMo in Ghana/Uganda, Airtel Money)?
2. Does the business already use, or is it required to use, a specific card
 payment processor?
3. What payout schedule do merchants actually expect (daily, weekly, both, or
 configurable per merchant)?
4. What documents are required for KYC verification, and are there
 country-specific regulatory requirements to satisfy?

