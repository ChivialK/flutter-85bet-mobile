import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/general/toast_widget_export.dart';

///
/// Test basic field input and scroll on focus
///
class TestBasicInputWidget extends StatefulWidget {
  @override
  State createState() => new _TestBasicInputWidgetState();
}

class _TestBasicInputWidgetState extends State<TestBasicInputWidget>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<FormState> _formKey =
      new GlobalKey(debugLabel: 'form');
  Key _k1 = new GlobalKey();
  Key _k2 = new GlobalKey();
  String _email, _password;

  void validate() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      callToast(('email: $_email\npassword: $_password'));
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("building login");
    return InkWell(
      // to dismiss the keyboard when the user tabs out of the TextField
      splashColor: Colors.transparent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: new Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new TextFormField(
              key: _k1,
              decoration: InputDecoration(labelText: 'E-Mail'),
              onSaved: (val) => _email = val.trim(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: new TextFormField(
                key: _k2,
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (val) => _password = val.trim(),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: RaisedButton(
                onPressed: () => validate(),
                child: Text('Validate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
