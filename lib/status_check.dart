import 'package:flutter/material.dart';

import 'package:grievance_redressal_system/request.dart' as request;
import 'package:grievance_redressal_system/utils.dart';

class StatusCheck extends StatefulWidget {
  StatusCheck({Key key}) : super(key: key);

  @override
  _StatusCheckState createState() => _StatusCheckState();
}

class _StatusCheckState extends State<StatusCheck> {
  final _complaintIDController = TextEditingController();
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BackButton(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
                child: Text(
                  'Please enter your complaint/suggestion ID',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 165,
                left: 15,
                right: 15,
              ),
              child: TextFormField(
                controller: _complaintIDController,
                keyboardType: TextInputType.text,
                autovalidate: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  hintText: 'eg. MRV10525',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints.expand(height: 70),
                child: RaisedButton(
                  textTheme: ButtonTextTheme.primary,
                  color: Theme.of(context).buttonColor,
                  // shape: StadiumBorder(),
                  child: Text(
                    'Check Status',
                    style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: () {
                    request.checkStatus(
                        context, _complaintIDController.value.text);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
