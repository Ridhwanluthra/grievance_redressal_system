import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mrv_connect/request.dart' as request;
import 'package:mrv_connect/utils.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final _formKey = GlobalKey<FormState>();
  var _childName, _parentName, _phone, _suggestion, _branch;
  bool _autoValidate = false;
  final nameNode = FocusNode();

  final List<String> branches = <String>[
    'Tilak Nagar',
    'Vikaspuri',
    'Janakpuri',
    'General',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/suggestions.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: formUI(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Container(
                        constraints: BoxConstraints.expand(height: 70),
                        child: RaisedButton(
                          textTheme: ButtonTextTheme.primary,
                          color: Theme.of(context).buttonColor,
                          shape: StadiumBorder(),
                          child: Text(
                            'Submit',
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: _validateInputs,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BackButton(),
            ),
          ],
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      request.sendRequest(
        context,
        _formKey,
        _childName,
        _parentName,
        _phone,
        _suggestion,
        _branch,
        'suggestion',
        nameNode,
      );
      setState(() {
        _branch = null;
        _autoValidate = false;
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget formUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'What is your suggestion?',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              onSaved: (String val) {
                _childName = val;
              },
              focusNode: nameNode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: 'Child\'s name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              onSaved: (String val) {
                _parentName = val;
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: 'Parent\'s name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              onSaved: (String val) {
                _phone = val;
              },
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value.length != 10) {
                  return 'Please enter a 10 digit phone no.';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: 'Phone No.',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: DropdownButtonFormField(
              validator: (value) {
                if (value == null) {
                  return 'Please select the branch.';
                }
                return null;
              },
              isExpanded: true,
              value: _branch,
              // autofocus: false,
              hint: Text("Branch"),
              onSaved: (value) {
                _branch = value;
              },
              onChanged: (value) => setState(() {
                _branch = value;
              }),
              items: branches.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextFormField(
              onSaved: (String val) {
                _suggestion = val;
              },
              enabled: _branch != null,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                hintText: 'Your suggestion',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   void _validateInputs() {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       request.sendSuggestion(
//         context,
//         _formKey,
//         _name,
//         _address,
//         _phone,
//         _suggestion,
//         'suggestion',
//         nameNode,
//       );
//       setState(() {
//         _autoValidate = false;
//       });
//     } else {
//       setState(() {
//         _autoValidate = true;
//       });
//     }
//   }

//   Widget formUI() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Center(
//             child: Text(
//               'What is your suggestion?',
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: TextFormField(
//               onSaved: (String val) {
//                 _name = val;
//               },
//               focusNode: nameNode,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 2.0),
//                 ),
//                 hintText: 'Your name',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: TextFormField(
//               onSaved: (String val) {
//                 _address = val;
//               },
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 2.0),
//                 ),
//                 hintText: 'Your address',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: TextFormField(
//               onSaved: (String val) {
//                 _phone = val;
//               },
//               keyboardType: TextInputType.phone,
//               validator: (value) {
//                 if (value.length != 10) {
//                   return 'Please enter a 10 digit phone no.';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 2.0),
//                 ),
//                 hintText: 'Phone No.',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10.0),
//             child: TextFormField(
//               onSaved: (String val) {
//                 _suggestion = val;
//               },
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 2.0),
//                 ),
//                 hintText: 'Your suggestion',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
