import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key key}) : super(key: key);

  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('history');

  bool data;

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
      body: SafeArea(
        child: StreamBuilder(
            stream: reference.orderBy("time").snapshots(),
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
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitFadingCircle(
                  color: Colors.black,
                  size: 40,
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                physics: BouncingScrollPhysics(),
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
      ),
    );
  }
}
