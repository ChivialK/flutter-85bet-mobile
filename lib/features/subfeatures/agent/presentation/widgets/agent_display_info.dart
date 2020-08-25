import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';
import 'package:flutter_85bet_mobile/features/general/widgets/customize_field_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/models/agent_model.dart';
import '../state/agent_store.dart';
import 'agent_inherit_widget.dart';

class AgentDisplayInfo extends StatefulWidget {
  @override
  _AgentDisplayInfoState createState() => _AgentDisplayInfoState();
}

class _AgentDisplayInfoState extends State<AgentDisplayInfo>
    with AfterLayoutMixin {
  static final Key _streamKey = new Key('agentstream');
  final GlobalKey<CustomizeFieldWidgetState> _codeFieldKey =
      new GlobalKey(debugLabel: 'code');
  final GlobalKey<CustomizeFieldWidgetState> _linkFieldKey =
      new GlobalKey(debugLabel: 'link');
  final GlobalKey<CustomizeFieldWidgetState> _agentsFieldKey =
      new GlobalKey(debugLabel: 'agents');

  AgentStore _store;
  AgentModel _storeData;
  String _agentUrl;
  int _agentCode;
  bool _hasDescendant = false;
  List<String> _descendants;
  bool _layoutReady = false;

  void updateField() {
    if (_store == null || _storeData == null) return;
    _agentCode = _storeData.code;
    _agentUrl = _storeData.url;
    _descendants = _storeData.descendant.map((item) => '$item').toList();
    _hasDescendant = _descendants != null && _descendants.isNotEmpty;
    debugPrint(
        'agent code: $_agentCode\nagent qr: $_agentUrl\nagent has descendant: $_hasDescendant');
    _codeFieldKey.currentState.setInput =
        (_agentCode == -1) ? '' : '$_agentCode';
    _linkFieldKey.currentState.setInput = _agentUrl;
    _agentsFieldKey.currentState.setInput = _descendants.join(', ');
    debugPrint('agent field updated');
  }

  @override
  Widget build(BuildContext context) {
    _store ??= AgentStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.AGENT)).message,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 4.0),
      child: StreamBuilder<AgentModel>(
        key: _streamKey,
        stream: _store.agentStream,
        initialData: _store.agentData,
        builder: (context, snapshot) {
          if (_storeData != snapshot.data) {
            debugPrint('agent stream snapshot: ${snapshot.data}');
            _storeData = snapshot.data;
            if (_layoutReady) updateField();
          }
          return Column(
            children: <Widget>[
              new CustomizeFieldWidget(
                key: _codeFieldKey,
                horizontalInset: 12.0,
                fieldType: FieldType.Numbers,
                hint: '',
                persistHint: false,
                prefixText: localeStr.agentInfoFieldCode,
                suffixText: (_agentCode == null)
                    ? localeStr.agentInfoFieldButtonGetCode
                    : null,
                suffixLetterWidth: 6,
                suffixAction: (_) => _store.getAgentQr(),
                readOnly: true,
              ),
              new CustomizeFieldWidget(
                key: _linkFieldKey,
                horizontalInset: 12.0,
                hint: '',
                persistHint: false,
                prefixText: localeStr.agentInfoFieldLink,
                minusHeight:
                    (_agentUrl != null && _agentUrl.isNotEmpty) ? -8 : 8,
//                suffixText: (_agentUrl != null && _agentUrl.isNotEmpty)
//                    ? localeStr.agentButtonTextShare
//                    : null,
//                suffixLetterWidth: 6,
//                suffixAction: (input) {
//                  try {
//                    ShareExtend.share(
//                      _agentUrl,
//                      'text',
//                      subject: localeStr.agentInfoFieldLink,
//                    );
//                  } on Exception {
//                    callToastInfo(localeStr.workInProgress);
//                  }
//                },
                suffixIconData: (_agentUrl != null && _agentUrl.isNotEmpty)
                    ? Icons.content_copy
                    : null,
                suffixAction2: (input) {
                  Clipboard.setData(new ClipboardData(text: input));
                  Future.delayed(Duration(milliseconds: 200)).then(
                    (value) => callToast(localeStr.messageCopy),
                  );
                },
                readOnly: true,
                maxLines:
                    (_agentUrl != null && _agentUrl.isNotEmpty) ? 2 : null,
              ),
              new CustomizeFieldWidget(
                key: _agentsFieldKey,
                horizontalInset: 12.0,
                hint: '',
                persistHint: false,
                prefixText: localeStr.agentInfoFieldAgents,
                suffixText: (_hasDescendant) ? localeStr.btnShow : null,
                suffixLetterWidth: 4,
                suffixAction: (input) {
                  debugPrint('show agents');
                },
                useSameBgColor: !_hasDescendant,
                readOnly: true,
              ),
              if (_agentUrl != null && _agentUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    color: Colors.white,
                    child: QrImage(
                      data: _agentUrl,
                      version: QrVersions.auto,
                      size: 120.0,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _layoutReady = true;
    updateField();
    setState(() {});
  }
}
