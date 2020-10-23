///
/// Field input length limit
/// remember to check the locale strings
///
class InputLimit {
  static const int PASSWORD_MIN_OLD = 8;
  static const int PASSWORD_MIN = 8;
  static const int PASSWORD_MAX = 18;

  static const int ACCOUNT_MIN = 6;
  static const int ACCOUNT_MAX = 12;

  static const int PHONE_MIN = 10;
  static const int PHONE_MAX = 10;

  static const int NAME_MIN = 4;
  static const int NAME_MAX = 50;

  static const int POSTCODE_MAX = 8;
  static const int ADDRESS_MAX = 100;
  static const int NOTE_MAX = 30;

  static const int CARD_MIN = 5;
  static const int CARD_MAX = 19; // vn365:6~19   85bet:5~19   kk:6~18

  static const int RECOMMEND = 6;
  static const int VERIFY = 8;
  static const int DATE = 10;
  static const int AMOUNT = 12;
  static const int AMOUNT_LONG = 16;
}
