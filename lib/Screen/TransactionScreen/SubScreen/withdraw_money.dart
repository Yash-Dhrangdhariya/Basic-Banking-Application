import 'package:balance/Widgets/custom_dialog_box.dart';
import 'package:balance/Widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Widgets/custom_dropdown.dart';

class WithdrawMoney extends StatefulWidget {
  const WithdrawMoney({Key key}) : super(key: key);

  @override
  _WithdrawMoneyState createState() => _WithdrawMoneyState();
}

class _WithdrawMoneyState extends State<WithdrawMoney> {
  final _formKey = GlobalKey<FormState>();
  bool isSuccessful = false;
  String message, desc, time, subMessage;
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

  // var _balance;
  String _currentUser;
  String name = 'yash';
  String error = "";
  var _amount;
  var currentBalance;

  @override
  initState() {
    super.initState();
    if (_currentUser == null) {
      currentBalance = "0";
    } else {
      _readBalanceOfUser(_currentUser);
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

  void _readBalanceOfUser(String user) async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await _firebaseFirestore.collection('users').doc('$user').get();
      setState(() {
        currentBalance = documentSnapshot.data()['balance'];
      });
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  void _deductMoney() async {
    int balance = int.parse(currentBalance);
    int amount = int.parse(_amount);
    if (balance == 0) {
      setState(() {
        message = 'Transaction Unsuccessful';
        subMessage = "You have not sufficient balance to Withdraw Money.";
        isSuccessful = false;
      });
    } else if (amount > balance) {
      setState(() {
        message = 'Transaction Unsuccessful';
        subMessage =
            'You can\'t withdraw money with greater amount from balance.';
        isSuccessful = false;
      });
    } else {
      setState(() {
        // int sum = int.parse(_balance) - int.parse(_amount);
        int sum = balance - amount;
        currentBalance = sum.toString();
        message = "Transaction Successful";
        subMessage = "$_amount/- Rupees withdraw from $_currentUser";
        isSuccessful = true;
        _history(
          desc: desc,
          amount: _amount,
          time: time,
          url: url,
          user: _currentUser,
        );
      });
      _updateBalanceToUser(
          balance: currentBalance, user: _currentUser.toLowerCase());
      _readBalanceOfUser(_currentUser.toLowerCase());
    }
  }

  void _history(
      {String desc,
      String amount,
      String time,
      String url,
      String user}) async {
    try {
      _firebaseFirestore.collection('history').doc().set({
        'desc': desc,
        'amount': amount,
        'time': time,
        'image': url,
        'sender': user,
        'receiver': user,
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
          "Withdraw Money",
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
                _currentUser == null
                    ? Text(
                        '*Select User to Withdraw Money',
                      )
                    : Text(
                        '$_currentUser\'s Balance is: $currentBalance /-Rs',
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
                CustomDropDown(
                  validator: (val) => val != null ? null : 'Please select user',
                  hint: "Select User",
                  items: userNames.map((String users) {
                    return DropdownMenuItem<String>(
                      value: users,
                      child: Text('$users'),
                    );
                  }).toList(),
                  onChanged: (String val) {
                    setState(() {
                      this._currentUser = val;
                    });
                    _readBalanceOfUser(_currentUser.toLowerCase());
                  },
                  value: _currentUser,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFieldContainer(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'Please enter amount',
                    onChanged: (val) => _amount = val.toString(),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: "Enter Amount",
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
                      var currentDesc = "Money Withdraw \nFrom: $_currentUser";
                      setState(() {
                        time = currentTime.toString();
                        desc = currentDesc;
                      });
                      _deductMoney();
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
