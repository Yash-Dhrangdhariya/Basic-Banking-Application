import 'package:balance/Widgets/custom_dialog_box.dart';
import 'package:balance/Widgets/custom_text_field.dart';
import 'package:balance/Widgets/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({Key key}) : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  String message, senderBalance, receiverBalance, subMessage;
  bool isSuccessful = false;
  final _formKey = GlobalKey<FormState>();
  String desc, time;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String url =
      "https://firebasestorage.googleapis.com/v0/b/new-yash-project.appspot.com/o/minus.png?alt=media&token=1d49861f-6d79-4a3a-a99a-df1cbb229e2f";

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

  String name = 'yash';
  String sender, senderName;
  String receiver, receiverName;
  String error = "";
  var _amount;
  var currentBalanceOfSender, currentBalanceOfReceiver;

  @override
  initState() {
    super.initState();
    if (senderName == null && receiverName == null) {
      currentBalanceOfSender = '0';
      currentBalanceOfReceiver = '0';
    } else {
      _readBalanceOfSender(senderName);
      _readBalanceOfReceiver(receiverName);
    }
  }

  void _transferMoney() async {
    try {
      _deductMoneyOfSender(senderName);
      _addMoneyToReceiver(receiverName);
    } catch (e) {
      print(e);
    }
  }

  void _readBalanceOfSender(String user) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await _firebaseFirestore.collection('users').doc('$user').get();
      setState(() {
        currentBalanceOfSender = documentSnapshot.data()['balance'];
        senderBalance = documentSnapshot.data()['balance'];
      });
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  void _readBalanceOfReceiver(String user) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await _firebaseFirestore.collection('users').doc('$user').get();
      setState(() {
        currentBalanceOfReceiver = documentSnapshot.data()['balance'];
        receiverBalance = documentSnapshot.data()['balance'];
      });
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  void _addMoneyToReceiver(String name) async {
    int balance = int.parse(senderBalance);
    int amount = int.parse(_amount);
    if (balance == 0) {
      print('You can\'t deduct money');
      setState(() {
        message = 'Transaction Unsuccessful';
        subMessage = "You have not sufficient balance to transfer Money.";
        isSuccessful = false;
      });
    } else if (amount > balance) {
      print('You have not insufficient balance');
      setState(() {
        message = 'Transaction Unsuccessful';
        subMessage = "You have not sufficient balance to transfer Money.";
        isSuccessful = false;
      });
    } else {
      setState(() {
        int sum = int.parse(currentBalanceOfReceiver) + int.parse(_amount);
        currentBalanceOfReceiver = sum.toString();
        message = "Transaction Successful";
        subMessage = "$_amount/- Rupees transferred from $sender to $receiver";
        isSuccessful = true;
        _history(
          desc: desc,
          amount: _amount,
          time: time,
          url: url,
          sender: sender,
          receiver: receiver,
        );
      });
    }
    _updateBalanceToUser(balance: currentBalanceOfReceiver, user: name);
  }

  void _deductMoneyOfSender(String name) async {
    int balance = int.parse(currentBalanceOfSender);
    int amount = int.parse(_amount);
    if (balance == 0) {
      print('You can\'t deduct money');
      setState(() {
        message = 'Transaction Unsuccessful';
        subMessage = "You have not sufficient balance to transfer Money.";
        isSuccessful = false;
      });
    } else if (amount > balance) {
      print('You have not insufficient balance');
      setState(() {
        subMessage = "You have not sufficient balance to transfer Money.";
        isSuccessful = false;
      });
    } else {
      setState(() {
        // int sum = int.parse(_balance) - int.parse(_amount);
        int sum = balance - amount;
        currentBalanceOfSender = sum.toString();
        message = "Congratulation, Transaction Successful";
        isSuccessful = true;
      });
      _updateBalanceToUser(balance: currentBalanceOfSender, user: name);
    }
  }

  void _updateBalanceToUser({String balance, String user}) async {
    try {
      _firebaseFirestore.collection('users').doc('$user').update({
        'balance': balance,
      });
    } catch (e) {
      print(e);
    }
  }

  void _history(
      {String desc,
      String amount,
      String time,
      String url,
      String sender,
      String receiver}) async {
    try {
      _firebaseFirestore.collection('history').doc().set({
        'desc': desc,
        'amount': amount,
        'time': time,
        'image': url,
        'sender': sender,
        'receiver': receiver,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeabf9f),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xff1e212d),
        ),
        title: Text(
          "Transfer Money",
          style: TextStyle(color: Color(0xff1e212d)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      sender != null ? 'From: $sender ' : 'From: ',
                    ),
                    Text(
                      receiver != null ? 'To: $receiver ' : 'To: ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Color(0xff1e212d),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomDropDown(
                        validator: (sender) {
                          if (sender == null) {
                            setState(() {
                              error = "Please select sender";
                            });
                            return error;
                          } else if (sender == receiver) {
                            setState(() {
                              error =
                                  "You can\'t choose same user to send money";
                            });
                            return error;
                          } else {
                            setState(() {
                              error = "";
                            });
                            return null;
                          }
                        },
                        hint: "From User",
                        items: userNames.map((String users) {
                          return DropdownMenuItem<String>(
                            value: users,
                            child: Text('$users'),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          setState(() {
                            this.sender = val;
                            senderName = sender.toLowerCase();
                            _readBalanceOfSender(senderName);
                          });
                          // _readBalanceOfUser(_currentUser.toLowerCase());
                        },
                        value: sender,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomDropDown(
                        validator: (receiver) {
                          if (receiver == null) {
                            setState(() {
                              error = "Please select receiver";
                            });
                            return error;
                          } else if (receiver == sender) {
                            setState(() {
                              error =
                                  "You can\'t choose same user to send money";
                            });
                            return error;
                          } else {
                            setState(() {
                              error = "";
                            });
                            return null;
                          }
                        },
                        hint: "To User",
                        items: userNames.map((String users) {
                          return DropdownMenuItem<String>(
                            value: users,
                            child: Text('$users'),
                          );
                        }).toList(),
                        onChanged: (String val) {
                          setState(() {
                            this.receiver = val;
                            receiverName = receiver.toLowerCase();
                            _readBalanceOfReceiver(receiverName);
                          });
                        },
                        value: receiver,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFieldContainer(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter amount' : null,
                    onChanged: (val) => _amount = val.toString(),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Transfer Amount",
                      labelStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                      hintText: "Amount",
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Color(0xff1e212d),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      String currentTime = DateFormat('d MMM - EEE - kk:mm ')
                          .format(DateTime.now());
                      var currentDesc =
                          "Money Transferred \nFrom: $sender To: $receiver";
                      setState(() {
                        desc = currentDesc;
                        time = currentTime;
                      });
                      _transferMoney();
                      Navigator.pop(context);
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            title: "$message",
                            isSuccess: isSuccessful,
                            description: "$subMessage",
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: const Size.fromHeight(50),
                    primary: Color(0xff1e212d),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffb68973),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
