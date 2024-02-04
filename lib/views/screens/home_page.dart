import 'package:flutter/material.dart';
import 'package:flutter_group_1/core/settings_util.dart';
import 'package:flutter_group_1/views/screens/cart_page.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/categories_screen.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/main_screen.dart';
import 'package:flutter_group_1/views/screens/nav_bar_pages/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  String phoneNumber = "";
  List<Widget> pages = [
    const MainScreen(),
    const CategoriesScreen(),
    const SettingsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> getPhoneNumber() async {
    phoneNumber = await SettingsUtil.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 250,
              color: Color.fromARGB(255, 36, 191, 218),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 35,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 168, 213, 223),
                        child: Icon(
                          Icons.person,
                          size: 60,
                        ),
                        radius: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Phone: $phoneNumber",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )),
            InkWell(
                onTap: () async {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const ListTile(
                    leading: Icon(
                      Icons.add_shopping_cart,
                      size: 40,
                    ),
                    title: Text(
                      "Add product",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )),
            InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.shopping_bag,
                    size: 40,
                  ),
                  title: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )),
            InkWell(
                onTap: () async {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 40,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  SettingsUtil.signOutDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: const ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 40,
                    ),
                    title: Text(
                      "Sign out",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
