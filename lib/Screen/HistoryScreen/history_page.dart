import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Widgets/custom_dropdown.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key key}) : super(key: key);

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('history');

  bool data;
  String sortBySender;
  String sortByReceiver;

  final List<String> userNames = [
    'Yash',
    'Aniket',
    'Raj',
    'Kishan',
    'Dharmik',
    'Prince',
    'Abdullah',
    'Ravi',
    "Dwarkesh",
    "Rushi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeabf9f),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort By:",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                        sortBySender != null || sortByReceiver != null ? TextButton(
                          onPressed: () {
                            setState(() {
                              sortBySender = null;
                              sortByReceiver = null;
                            });
                            print("Clear");
                          },
                          child: Text(
                            "Clear Filter",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),
                        ) : Container(),
                      ],
                    ),
                    sortBySender != null || sortByReceiver != null ? Container() :  SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sender:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomDropDown(
                                validator: (val) => val != null ? null : null,
                                hint: "Sender",
                                items: userNames.map((String users) {
                                  return DropdownMenuItem<String>(
                                    value: users,
                                    child: Text('$users'),
                                  );
                                }).toList(),
                                onChanged: (String val) {
                                  setState(() {
                                    sortBySender = val;
                                  });
                                },
                                value: sortBySender,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Receiver:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomDropDown(
                                validator: (val) => val != null ? null : null,
                                hint: "Receiver",
                                items: userNames.map((String users) {
                                  return DropdownMenuItem<String>(
                                    value: users,
                                    child: Text('$users'),
                                  );
                                }).toList(),
                                onChanged: (String val) {
                                  setState(() {
                                    sortByReceiver = val;
                                  });
                                },
                                value: sortByReceiver,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                  stream: reference
                      .orderBy("time", descending: false)
                      .where("sender", isEqualTo: sortBySender)
                      .where("receiver", isEqualTo: sortByReceiver)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.exclamationmark_circle,
                              size: 48,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Oops!\nSomething went wrong",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return SpinKitFadingCircle(
                        color: Colors.black,
                        size: 40,
                      );
                    } else if (snapshot.data.docs.length == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Center(
                          child: Text("No Data!"),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            elevation: 2,
                            color: Color(0xfffaf3e0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 6, bottom: 6, right: 6),
                              isThreeLine: true,
                              leading: Image.network(
                                '${snapshot.data.docs[index]['image']}',
                                width: 24,
                                height: 24,
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Amount: ${snapshot.data.docs[index]['amount']}/-Rs',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Date: ${snapshot.data.docs[index]['time']}',
                                    style: TextStyle(
                                      // color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  snapshot.data.docs[index]['desc'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    // color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
