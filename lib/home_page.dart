import 'package:balance/Screen/UsersScreen/UserListPage.dart';
import 'package:balance/Screen/HistoryScreen/history_page.dart';
import 'package:balance/Screen/TransactionScreen/transaction_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home-page";

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  List<Widget> _screen = <Widget>[
    UserList(),
    TransactionPage(),
    HistoryList(),
  ];

  List images = [
    "assets/icons/users.png",
    "assets/icons/transaction.png",
    "assets/icons/clock.png",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _screen.elementAt(selectedIndex),
        ),
      ),
      backgroundColor: Color(0xffeabf9f),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff1e212d),
          child: Container(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 14),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        width: 35,
                        child: Image(
                          image: AssetImage(images[index]),
                          color: index == selectedIndex
                              ? Color(0xfffaf3e0)
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
