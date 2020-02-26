import 'package:flutter/material.dart';
import 'package:mrv_connect/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/contact_us.jpg",
                  fit: BoxFit.fitWidth,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(5),
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            callable(
                                contactHeading(
                                    context, Icons.email, 'Email Id'),
                                'mailto:info@mrvinternational.in'),
                            callable(contactData('info@mrvinternational.in'),
                                'mailto:info@mrvinternational.in'),
                            callable(
                                contactHeading(context, Icons.contact_phone,
                                    'Mrs. Sandhya Khurana'),
                                'tel:01147537173'),
                            callable(
                                contactData('01147537173'), 'tel:01147537173'),
                            callable(
                                contactHeading(
                                    context, Icons.phone, 'Mr. Tarun Chopra'),
                                'tel:9250900575'),
                            callable(
                                contactData('9250900575'), 'tel:9250900575'),
                            callable(
                                contactHeading(
                                    context, Icons.location_city, 'Address'),
                                'https://g.page/plauditminds?share'),
                            callable(
                                contactData(
                                    'G-152, ground floor, vikaspuri, New Delhi - 110018'),
                                'https://g.page/plauditminds?share'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
}

Widget contactHeading(BuildContext context, IconData iconData, String data) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: <Widget>[
        Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            data,
            style: TextStyle(
              // color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget contactData(String data) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
    child: Text(
      data,
      style: TextStyle(
        fontSize: 18.0,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

Widget callable(Widget child, String url) {
  return GestureDetector(
    child: child,
    onTap: () => _call(url),
  );
}

_call(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not open $url';
  }
}
