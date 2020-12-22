import 'package:flutter/foundation.dart';
import 'package:flutter_85bet_mobile/core/internal/local_strings.dart';
import 'package:flutter_85bet_mobile/features/router/route_enum.dart';
import 'package:flutter_85bet_mobile/utils/regex_util.dart';

class MessageMap {
  static String getSuccessMessage(String msgKey, RouteEnum from) {
    if (msgKey != null && msgKey.isNotEmpty && msgKey.hasChinese) return msgKey;
    switch (from) {
      case RouteEnum.AGENT_REGISTER:
        return localeStr.agentRegisterSuccess;
      default:
        break;
    }
    return localeStr.messageSuccess;
  }

  static String getErrorMessage(String msgKey, RouteEnum from) {
    if (msgKey == null || msgKey.isEmpty) return localeStr.messageFailed;
    if (msgKey.hasChinese) return msgKey;
    debugPrint('looking for error message: $msgKey');
    switch (msgKey) {
      case 'dobBefore':
        return localeStr.messageInvalidBirthDate;
      case 'mobileRepeat':
        return localeStr.messageRepeatMobile;
      case 'mobileError':
        return localeStr.messageErrorMobile;
      case 'agentCodeError':
        return localeStr.messageErrorReferral;
      case 'repeatAccount':
      case 'RepeatAccount':
      case 'accountRepeat':
        return localeStr.messageRepeatAccount;
      case 'accountError':
        return localeStr.messageErrorAccount;
      case 'accountInvalid':
        return localeStr.messageErrorAccountIsLocked;
      case 'pwdError':
        return localeStr.messageErrorPassword;
      case 'pwdErrorFive':
        return localeStr.messageInvalidPasswordFive;
      case 'pwdErrorFiveStop':
        return localeStr.messageInvalidPasswordLocked;
      case 'wrongPassword':
        return localeStr.messageInvalidWithdrawPassword;
      case 'dobBefore':
        return localeStr.betsFieldDateError;
      case 'amountMoreThanBalance':
        return localeStr.messageInvalidWithdrawAmount;
      case 'belowTheMinimum':
        return localeStr.messageInvalidDepositAmountMin(100);
      case 'aboveTheCeiling':
        return localeStr.messageInvalidWithdrawExceedAmount;
      case 'amountExceedsTheUpperLimit':
        return localeStr.messageInvalidDepositAmountMaxLimit;
      case 'amountIsBelowTheLowerLimit':
        return localeStr.messageInvalidDepositAmountMinLimit;
      case 'NoRecordsYet':
        return localeStr.messageWarnNoHistoryData;
      default:
        break;
    }
    switch (from) {
      case RouteEnum.LOGIN:
        return localeStr.messageLoginFailed;
      case RouteEnum.REGISTER:
        return localeStr.messageRegisterFailed;
      case RouteEnum.BANKCARD:
        return localeStr.messageTaskFailed(localeStr.messageErrorBindBankcard);
      case RouteEnum.WITHDRAW:
        return localeStr.messageErrorWithdraw;
      case RouteEnum.DEPOSIT:
        return localeStr.depositMessageFailed;
      case RouteEnum.BALANCE:
        return localeStr.messageTaskFailed(localeStr.transferResultAlertTitle);
      default:
        if (msgKey.isNotEmpty) {
          return localeStr.messageErrorStatus(msgKey);
        }
        break;
    }
    return localeStr.messageFailed;
  }
}
