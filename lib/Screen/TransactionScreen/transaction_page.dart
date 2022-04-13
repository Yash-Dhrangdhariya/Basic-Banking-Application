import 'package:balance/Screen/TransactionScreen/SubScreen/add_money.dart';
import 'package:balance/Screen/TransactionScreen/SubScreen/transfer_money.dart';
import 'package:balance/Screen/TransactionScreen/SubScreen/withdraw_money.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeabf9f),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Transaction",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMoneyPage(),
                      ),
                    );
                  },
                  // fillColor: Color.fromRGBO(138, 115, 108, 1),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Color(0xff1e212d),
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Add Money",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WithdrawMoney()));
                  },
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    "assets/icons/withdraw-money.svg",
                    color: Color(0xff1e212d),
                    width: 60,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Withdraw Money",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                RawMaterialButton(
                  elevation: 4,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransferMoney()));
                  },
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    CupertinoIcons.arrow_right_arrow_left,
                    color: Color(0xff1e212d),
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Transfer Money",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
