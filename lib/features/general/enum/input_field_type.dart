part of '../widgets/customize_field_widget.dart';

enum FieldType {
  Normal,
  ChineseOnly,
  NoChinese,
  NoEnglish,
  TextOnly,
  Numbers,
  Email,
  Date,
  Password,
  Account
}

final _dateInputRegex = RegExp("-|[0-9]");

// 中文、注音、二聲、四聲、三聲、輕聲
final _chineseInputRegex = RegExp(
    "[\u4e00-\u9fa5]|[\u3105-\u3129]|[\u02CA]|[\u02CB]|[\u02C7]|[\u02C9]");

final _symbolsInputRegex = RegExp("[\$&+,:;=?@#|'<>.-^*()%!_ ]");

final _engInputRegex = RegExp("[a-zA-Z]");

final _engSpaceInputRegex = RegExp("[a-zA-Z ]");

final _numInputRegex = RegExp("[0-9]");

final _chineseInputFormatter =
    WhitelistingTextInputFormatter(_chineseInputRegex);

final _numbersInputFormatter = WhitelistingTextInputFormatter.digitsOnly;

final _dateInputFormatter = WhitelistingTextInputFormatter(_dateInputRegex);

final _textOnlyInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_engSpaceInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);

final _accountInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|[!#_\$%&*+-=?^@]"),
);

final _emailInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|[!#\$%&'*+-/=?^_`{|}~.@]"),
);

final _withoutEngInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);

final _withoutChineseInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}"),
);

final _normalInputFormatter = WhitelistingTextInputFormatter(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);
