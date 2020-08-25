import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/bloc_widget_export.dart';
import 'package:flutter_85bet_mobile/temp/blank_widget.dart';
import 'package:flutter_85bet_mobile/template/mobx/presentation/state/template_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../injection_container.dart';

class TemplateRoute extends StatefulWidget {
  @override
  _TemplateRouteState createState() => _TemplateRouteState();
}

class _TemplateRouteState extends State<TemplateRoute> {
  TemplateStore _templateStore;
  List<ReactionDisposer> _disposers;

  String _descText;

  void changeDesc(String desc) {
    setState(() {
      _descText = desc;
    });
  }

  @override
  void initState() {
    _templateStore ??= sl.get<TemplateStore>();
    super.initState();
    _templateStore.getDescription();
  }

  @override
  void didUpdateWidget(TemplateRoute oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        // Observe in page
        // Tell the reaction which observable to observe
        (_) => _templateStore.errorMessage,
        // Run some logic with the content of the observed field
        (String message) => changeDesc(message),
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Observer(
          // Observe using specific widget
          builder: (_) {
            switch (_templateStore.state) {
              case StoreState.initial:
                return BlankWidget();
              case StoreState.loading:
                return LoadingWidget();
              case StoreState.loaded:
                {
                  _descText = _templateStore.description;
                  return WarningDisplay(message: _descText);
                }
              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
