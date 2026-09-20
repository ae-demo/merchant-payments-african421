screen MerchantsList "Every merchant and its KYC status"
  navbar "Platform Admin"
  sidebar "Merchants -> MerchantsList | Transactions -> TransactionsOverview | Payouts -> PayoutsOverview"
  row
    heading "Merchants"
    right
    search "Search merchants"
    select "KYC status"
  table "Business | Country | KYC Status | Balance" -> MerchantDetail
    row "Accra Traders | Ghana | Pending | GHS 4,250.00"
    row "Nairobi Fresh Foods | Kenya | Approved | KES 120,000.00"
    row "Lagos Fabrics | Nigeria | Rejected | NGN 0.00"

screen MerchantDetail "Review a merchant's KYC submission"
  navbar "Platform Admin"
  heading "Accra Traders"
  row
    card "KYC status | Pending | submitted Sep 18"
    card "Balance | GHS 4,250.00 | next payout tomorrow"
  text "Business registration and owner ID documents"
  image "Business registration document"
  image "Owner ID document"
  row
    right
    button "Reject" danger -> MerchantsList
    button "Approve" primary -> MerchantsList

screen TransactionsOverview "Every transaction across all merchants"
  navbar "Platform Admin"
  sidebar "Merchants -> MerchantsList | Transactions -> TransactionsOverview | Payouts -> PayoutsOverview"
  row
    heading "Transactions"
    right
    search "Search transactions"
    select "Status"
  table "Merchant | Method | Amount | Status | Date"
    row "Accra Traders | Mobile Money | GHS 250.00 | Paid | Sep 19"
    row "Nairobi Fresh Foods | Card | KES 3,400.00 | Paid | Sep 19"
    row "Lagos Fabrics | Mobile Money | NGN 15,000.00 | Failed | Sep 18"

screen PayoutsOverview "Every payout, with failed ones flagged for action"
  navbar "Platform Admin"
  sidebar "Merchants -> MerchantsList | Transactions -> TransactionsOverview | Payouts -> PayoutsOverview"
  row
    heading "Payouts"
    right
    select "Status"
  table "Merchant | Amount | Bank Account | Status"
    row "Accra Traders | GHS 3,100.00 | GCB •••• 1234 | Completed"
    row "Nairobi Fresh Foods | KES 90,000.00 | Equity •••• 5678 | Failed"
    row "Lagos Fabrics | NGN 42,000.00 | GTB •••• 9012 | Completed"
  row
    right
    button "Resolve flagged payout" primary

flow "Admin monitoring"
  role "Platform Admin"
  description "A platform admin reviews merchant KYC submissions and monitors transactions and payouts"
  MerchantsList
  MerchantDetail
  TransactionsOverview
  PayoutsOverview
