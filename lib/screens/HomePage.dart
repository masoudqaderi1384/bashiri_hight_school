import 'package:bashiri_hight_school/Screens/Aboutlibrary.dart';
import 'package:bashiri_hight_school/Screens/BookManagement.dart';
import 'package:bashiri_hight_school/Screens/BookView.dart';
import 'package:bashiri_hight_school/Screens/MemberManage.dart';
import 'package:bashiri_hight_school/Screens/MemberView.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        initialIndex: 2,
        child: Scaffold(
          backgroundColor: Color(0x1f990000),
          appBar: AppBar(
            backgroundColor: Color(0xff990000),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_rounded),
              color: Colors.white,
            ),
            title: Text("نشر اصرار"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SaveMember();
                      });
                },
                icon: Icon(Icons.person_add_alt_1_sharp),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SaveBook();
                      });
                },
                icon: Icon(Icons.book),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person_pin_rounded, color: Color(0xffffffff)),
                ),
                Tab(
                  icon: Icon(Icons.menu_book_outlined, color: Color(0xffffffff)),
                ),
                Tab(
                  icon:
                      Icon(Icons.book_online_rounded, color: Color(0xffffffff)),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //3rd Tab
              MemberListPage(),
              //4th
              BookListPage(),
              //5th
              LibraryIntro(),
            ],
          ),
        ),
      ),
    );
  }
}

/*

* */
//TODO: MVoLn2eZLQCh0I3eiBFJ
//Todo: member TDaPqQ0nBGfzGt3dqewo

/*
  Container(
        color: Colors.white,
        child: ListView.builder(
          //itemCount: Myimage.length,
          itemBuilder: (c, i) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Icon(Icons.abc),
                  width: 50,
                  height: 80,
                  color: Colors.red,
                ),
              ),
              title: Text(
                Mylist[i],
                style: TextStyle(
                    fontFamily: 'comfortaa',
                    color: mycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              subtitle: Text(
                Mysubtitle[i],
                style: TextStyle(
                    fontFamily: 'comfortaa',
                    color: mycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(


 */