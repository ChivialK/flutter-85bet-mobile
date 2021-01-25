enum DepositPageType {
  LOCAL_BANK_OPTION, // returns ledger index
  LOCAL_BANK_DEPOSIT_INFO,
  ONLINE_BANK_OPTION, // returns deposit url
  ONLINE_BANK_DEPOSIT_INFO,
  QR_DEPOSIT_CODE, // returns ledger index
  QR_DEPOSIT_INFO,
  THIRD_PARTY_DEPOSIT_INFO, // returns deposit url
  ERROR,
}
