import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

Future<void> sendRequest(
  BuildContext context,
  GlobalKey<FormState> _formKey,
  String childName,
  String parentName,
  String phone,
  String complaintOrSuggestion,
  String branch,
  String type,
  FocusNode nameNode,
) async {
  String _complaintSuggestionID;
  final TransactionResult transactionResult = await databaseReference
      .child('id')
      .runTransaction((MutableData mutableData) async {
    print(mutableData.value);
    if (mutableData.value != null) {
      _complaintSuggestionID = mutableData.value.toString();
      databaseReference.child(type).child(_complaintSuggestionID).set({
        'childName': childName,
        'parentName': parentName,
        'phone': phone,
        type: complaintOrSuggestion,
        'branch': branch,
        'status': 'submitted',
      });
      mutableData.value++;
    }
    return mutableData;
  });

  if (transactionResult.committed) {
    showAlertDialog(context, _complaintSuggestionID, _formKey, nameNode, type);
  } else {
    print('Transaction not committed.');
    if (transactionResult.error != null) {
      print(transactionResult.error.message);
    }
  }
}

Future showAlertDialog(
  BuildContext context,
  String _complaintSuggestionID,
  GlobalKey<FormState> _formKey,
  FocusNode nameNode,
  String type,
) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "${type[0].toUpperCase()}${type.substring(1)} Successfully Registered.\n\n\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: "Your $type Id is ",
                        style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "MRV$_complaintSuggestionID",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: RaisedButton(
                    textTheme: ButtonTextTheme.primary,
                    color: Theme.of(context).buttonColor,
                    shape: StadiumBorder(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        // horizontal: 5.0,
                      ),
                      child: Text(
                        'Submit another $type',
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(fontSize: 18.0),
                      ),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                      Navigator.of(context).pop();
                      nameNode.requestFocus();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[],
        elevation: 0,
      );
    },
  );
}

checkStatus(BuildContext context, String id) {
  databaseReference.child(id.substring(2)).once().then((snapshot) {
    var _status = snapshot.value['status'];
    print(_status);
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Your complaint status is\n\n",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: "$_status".toUpperCase(),
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[],
          elevation: 0,
        );
      },
    );
  });
}
