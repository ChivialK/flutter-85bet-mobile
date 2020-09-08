enum BalanceGridAction { transferIn, transferOut, refresh }

typedef void BalanceGridCall(BalanceGridAction action, String platform);
