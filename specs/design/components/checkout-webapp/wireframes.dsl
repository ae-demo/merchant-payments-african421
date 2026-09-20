screen PaymentLinkView "What the customer sees when opening a payment link"
  navbar "Pay Accra Traders"
  card "Amount due | GHS 500.00 | Order #242"
  heading "Choose how to pay"
  row
    button "Pay with Mobile Money" primary -> MobileMoneyPayment
    button "Pay with Card" -> CardPayment

screen MobileMoneyPayment "Collect mobile money details"
  navbar "Pay Accra Traders"
  heading "Pay with Mobile Money"
  card "Amount due | GHS 500.00 | Order #242"
  select "Mobile network"
  input "Mobile number"
  row
    button "Back" -> PaymentLinkView
    right
    button "Confirm payment" primary -> PaymentResult

screen CardPayment "Collect card details"
  navbar "Pay Accra Traders"
  heading "Pay with Card"
  card "Amount due | GHS 500.00 | Order #242"
  input "Card number"
  row
    input "Expiry"
    input "CVV"
  row
    button "Back" -> PaymentLinkView
    right
    button "Confirm payment" primary -> PaymentResult

screen PaymentResult "Payment outcome"
  navbar "Pay Accra Traders"
  badge "Payment successful" success
  card "Amount paid | GHS 500.00 | Order #242"
  text "A receipt has been sent by email."

flow "Guest checkout"
  description "A customer opens a payment link and pays it with mobile money or a card"
  PaymentLinkView
  MobileMoneyPayment
  CardPayment
  PaymentResult
