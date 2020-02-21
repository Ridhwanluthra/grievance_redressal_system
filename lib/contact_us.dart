import 'package:flutter/material.dart';
import 'package:grievance_redressal_system/utils.dart';

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
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Rajiv Babbar',
                                style: TextStyle(
                                  // color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      '9212030000',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_city,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Address',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                'S-1/141, old mahavir nagar, opp - 20 block gurdwara - tilak nagar, 110018',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.contact_phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Landline',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                '01125993233',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Mamta Grover',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                '9871982223',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_city,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Address',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                'WZ-5A/32, Vishnu Garden, new delhi - 110018, Near 5 block gurdwara',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Vinay Rana',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                '9560117788',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Chaman Lal',
                                      style: TextStyle(
                                        // color: Colors.black,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              child: Text(
                                '9810974012',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
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

Widget contactCard(
    BuildContext context, IconData iconData, String heading, String data) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
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
                  heading,
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 18.0,
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
    ),
  );
}
