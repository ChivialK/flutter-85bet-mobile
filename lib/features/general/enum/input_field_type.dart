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

final _engLowercaseInputRegex = RegExp("[a-z]");

final _engSpaceInputRegex = RegExp("[a-zA-Z ]");

final _numInputRegex = RegExp("[0-9]");

final _chineseInputFormatter =
    FilteringTextInputFormatter.allow(_chineseInputRegex);

final _numbersInputFormatter = FilteringTextInputFormatter.digitsOnly;

final _dateInputFormatter = FilteringTextInputFormatter.allow(_dateInputRegex);

final _textOnlyInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_engSpaceInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);

final _accountInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_engLowercaseInputRegex.pattern}|"
      "${_numInputRegex.pattern}|[!#_\$%&*+-=?^@]"),
);

final _emailInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|[!#\$%&'*+-/=?^_`{|}~.@]"),
);

final _withoutEngInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);

final _withoutChineseInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}"),
);

final _normalInputFormatter = FilteringTextInputFormatter.allow(
  RegExp("${_engInputRegex.pattern}|"
      "${_numInputRegex.pattern}|"
      "${_symbolsInputRegex.pattern}|"
      "${_chineseInputRegex.pattern}"),
);
