import 'package:flutter/material.dart';
import 'package:mrv_connect/complaint_page.dart';
import 'package:mrv_connect/contact_us.dart';

import 'package:mrv_connect/status_check.dart';
import 'package:mrv_connect/suggestions_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  Widget button(BuildContext context, String text, Widget nextPage) {
    return RaisedButton(
      textTheme: ButtonTextTheme.primary,
      color: Theme.of(context).buttonColor,
      shape: StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextPage));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        // appBar: AppBar(
        //   title: Center(
        //     child: Text(
        //       "Better Bond",
        //       style: TextStyle(
        //         fontSize: 30,
        //         color: Color(0xffFFF212),
        //       ),
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "assets/landing.jpg",
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildPaddingButton(
                      child: RaisedButton(
                        textTheme: ButtonTextTheme.primary,
                        color: Theme.of(context).buttonColor,
                        shape: StadiumBorder(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Text(
                            'Submit a complaint',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComplaintPage()));
                        },
                      ),
                    ),
                    buildPaddingButton(
                      child: RaisedButton(
                        textTheme: ButtonTextTheme.primary,
                        color: Theme.of(context).buttonColor,
                        shape: StadiumBorder(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Text(
                            'Submit a suggestion',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuggestionPage()));
                        },
                      ),
                    ),
                    buildPaddingButton(
                      child: OutlineButton(
                        borderSide:
                            BorderSide(color: Theme.of(context).buttonColor),
                        highlightedBorderColor: Theme.of(context).primaryColor,
                        splashColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        textTheme: ButtonTextTheme.primary,
                        color: Theme.of(context).buttonColor,
                        shape: StadiumBorder(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Check status',
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Theme.of(context).accentColor,
                                ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatusCheck()));
                        },
                      ),
                    ),
                    buildPaddingButton(
                      child: FlatButton(
                        textTheme: ButtonTextTheme.primary,
                        splashColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        // color: Theme.of(context).buttonColor,
                        shape: StadiumBorder(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Contact us',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.grey[600]),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPaddingButton({Widget child}) {
    return Padding(padding: const EdgeInsets.all(10.0), child: child);
  }
}
