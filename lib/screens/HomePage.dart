import 'package:bashiri_hight_school/Screens/components/My_TextFilled.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/My_botton.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController idController = TextEditingController();
  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController translatorController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController publicationDateController = TextEditingController();
  TextEditingController pageCountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
            ]),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(onTap: () {}, bottomName: 'حذف'),
                MyButton(onTap: () {}, bottomName: 'ویرایش'),
                MyButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: SizedBox(
                                height: 600,
                                width: 320,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        "فورم ثبت کتاب",
                                        style: TextStyle(
                                            color: Color(0xff990000),
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: idController,
                                        hintText: "آی دی کتاب",
                                        obscureText: false,
                                        MyTextFieldIcon: Icons.numbers_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: bookNameController,
                                        hintText: 'نام کتاب',
                                        obscureText: false,
                                        MyTextFieldIcon:
                                            Icons.book_online_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: authorController,
                                        hintText: "نویسنده",
                                        obscureText: false,
                                        MyTextFieldIcon: Icons.person,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: translatorController,
                                        hintText: "مترجم",
                                        obscureText: false,
                                        MyTextFieldIcon: Icons.person,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: publisherController,
                                        hintText: "ناشر",
                                        obscureText: false,
                                        MyTextFieldIcon:
                                            Icons.home_work_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: publicationDateController,
                                        hintText: "تاریخ انتشار",
                                        obscureText: false,
                                        MyTextFieldIcon:
                                            Icons.date_range_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: pageCountController,
                                        hintText: "تعداد صفحه",
                                        obscureText: false,
                                        MyTextFieldIcon: Icons.pages_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: quantityController,
                                        hintText: "تعداد",
                                        obscureText: false,
                                        MyTextFieldIcon: Icons.numbers_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      MyTextField(
                                        controller: priceController,
                                        hintText: "قیمت",
                                        obscureText: false,
                                        MyTextFieldIcon:
                                            Icons.price_change_rounded,
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          Map <String, dynamic> data = {
                                            'ID': idController.text,
                                            'BookName': bookNameController.text,
                                            'BookWriter': authorController.text,
                                            'BookTranslate': translatorController.text,
                                            'Nasher': publisherController.text,
                                            'Number': quantityController.text,
                                            'Price': priceController.text,
                                            'PublishDate': publicationDateController.text,
                                            'PageNum': pageCountController.text,
                                          };
                                            CollectionReference collRef = FirebaseFirestore.instance.collection("BookManagement");
                                            collRef.add(data);

                                        },
                                        child: Text(
                                          "ثبت",
                                          style: TextStyle(color: Color(0xff990000)),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    bottomName: 'ذخیره'),
              ],
            )
          ],
        ));
  }
}
//TODO: MVoLn2eZLQCh0I3eiBFJ

/*
*  Container(
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
                      builder: (context) => SecondPage(
                        universityName: Mylist[i],
                        universityImage: Myimage[i],
                        universitySubtitle: Mysubtitle[i],
                        universityTitle: MyTitle[i],
                      )),
                );
              },
            );
          },
        ),
      ),
* */
