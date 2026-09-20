screen Dashboard "Merchant home: balance and recent activity"
  navbar "Merchant Payments"
  sidebar "Dashboard -> Dashboard | Payment Links -> PaymentLinks | Transactions -> Transactions | Payouts -> Payouts | Bank Account -> BankAccountSettings"
  row
    card "Available balance | GHS 4,250.00 | next payout tomorrow"
    card "Pending payments | 3 | awaiting customer action"
    card "This month | GHS 18,900.00 | collected"
  heading "Recent transactions"
  table "Date | Payment Link | Method | Amount | Status" -> Transactions
    row "Sep 19 | School fees | Mobile Money | GHS 250.00 | Paid"
    row "Sep 19 | Order #241 | Card | GHS 1,200.00 | Paid"
    row "Sep 18 | Order #240 | Mobile Money | GHS 90.00 | Failed"
  row
    right
    button "New payment link" primary -> CreatePaymentLink

screen BusinessProfileSetup "First-time business profile setup"
  navbar "Merchant Payments"
  heading "Tell us about your business"
  input "Business name"
  select "Country"
  input "Business email"
  input "Phone number"
  row
    right
    button "Continue to verification" primary -> KycSubmission

screen KycSubmission "Submit documents for verification"
  navbar "Merchant Payments"
  heading "Verify your business"
  text "Upload your business registration and an owner ID to start collecting live payments."
  select "Document type"
  input "Document upload URL"
  badge "Pending review" warning
  row
    right
    button "Submit for review" primary -> Dashboard

screen PaymentLinks "All payment links"
  navbar "Merchant Payments"
  sidebar "Dashboard -> Dashboard | Payment Links -> PaymentLinks | Transactions -> Transactions | Payouts -> Payouts | Bank Account -> BankAccountSettings"
  row
    heading "Payment links"
    right
    search "Search links"
    button "New payment link" primary -> CreatePaymentLink
  table "Description | Amount | Status | Created" -> PaymentLinkDetail
    row "School fees | GHS 250.00 | Paid | Sep 19"
    row "Order #241 | GHS 1,200.00 | Paid | Sep 19"
    row "Order #242 | GHS 500.00 | Pending | Sep 20"

screen CreatePaymentLink "Create a new payment link"
  navbar "Merchant Payments"
  heading "New payment link"
  input "Amount"
  select "Currency"
  textarea "Description"
  row
    button "Cancel" -> PaymentLinks
    right
    button "Create link" primary -> PaymentLinkDetail

screen PaymentLinkDetail "Payment link status and share"
  navbar "Merchant Payments"
  heading "Order #242"
  badge "Pending" warning
  card "Amount | GHS 500.00 | expires in 24 hours"
  input "Shareable link"
  row
    right
    button "Copy link" primary

screen Transactions "Transaction history"
  navbar "Merchant Payments"
  sidebar "Dashboard -> Dashboard | Payment Links -> PaymentLinks | Transactions -> Transactions | Payouts -> Payouts | Bank Account -> BankAccountSettings"
  row
    heading "Transactions"
    right
    search "Search transactions"
    select "Status"
  table "Date | Payment Link | Method | Amount | Status"
    row "Sep 19 | School fees | Mobile Money | GHS 250.00 | Paid"
    row "Sep 19 | Order #241 | Card | GHS 1,200.00 | Paid"
    row "Sep 18 | Order #240 | Mobile Money | GHS 90.00 | Failed"

screen Payouts "Balance and payout history"
  navbar "Merchant Payments"
  sidebar "Dashboard -> Dashboard | Payment Links -> PaymentLinks | Transactions -> Transactions | Payouts -> Payouts | Bank Account -> BankAccountSettings"
  row
    card "Available balance | GHS 4,250.00 | pays out daily"
    card "Linked account | GCB •••• 1234 | verified"
  heading "Payout history"
  table "Date | Amount | Bank Account | Status"
    row "Sep 19 | GHS 3,100.00 | GCB •••• 1234 | Completed"
    row "Sep 18 | GHS 2,400.00 | GCB •••• 1234 | Completed"
    row "Sep 17 | GHS 1,800.00 | GCB •••• 1234 | Failed"

screen BankAccountSettings "Link and manage payout bank account"
  navbar "Merchant Payments"
  sidebar "Dashboard -> Dashboard | Payment Links -> PaymentLinks | Transactions -> Transactions | Payouts -> Payouts | Bank Account -> BankAccountSettings"
  heading "Bank account"
  input "Bank name"
  input "Account number"
  input "Account name"
  row
    right
    button "Save bank account" primary

flow "Merchant onboarding and payments"
  role "Merchant"
  description "A merchant sets up its profile, submits KYC, creates payment links, and tracks transactions and payouts"
  Dashboard
  BusinessProfileSetup
  KycSubmission
  PaymentLinks
  CreatePaymentLink
  PaymentLinkDetail
  Transactions
  Payouts
  BankAccountSettings
