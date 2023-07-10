import 'package:ecommerce_project/providers/product_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class product_page extends StatefulWidget {
  var id_classs_shoes;

  product_page({required this.id_classs_shoes});

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  @override
  void initState() {
    super.initState();
    Provider.of<product_prove>(context, listen: false)
        .getproduct(id_classs_shoes: widget.id_classs_shoes);
  }

  Widget dotpageview() {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 6; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: i == pagenumber ? 25 : 6,
                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50),
                    color: i == pagenumber ? Colors.white : Colors.grey),
              ),
          ],
        );
      },
    );
  }

  int current_index = 0;
  PageController nextpage = PageController();
  int pagenumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        fixedColor: Color(0xffEC4156),
        currentIndex: current_index,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoutite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart')
        ],
      ),
      backgroundColor: Color(0xff272727),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pagenumber = value;
          });
        },
        controller: nextpage,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 53,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return ListView.builder(
                                itemCount: value.list_products.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Text(
                                    value.list_products[index].kind,
                                    style: TextStyle(color: Colors.white),
                                  );
                                });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(1,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[1].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[1].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(2,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(3,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(4,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(4,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(4,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(5,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage("images/img2.png")),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 70,
                      ),
                      Container(
                        width: 181,
                        height: 120,
                        child: Consumer<product_prove>(
                          builder: (context, value, child) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      value.list_products[1].kind,
                                      style: TextStyle(
                                          color: Color(0xffFCFCFC),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'lora'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    value.list_products[1].description,
                                    style: TextStyle(
                                        color: Color(0xffF8F8F8), fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 433,
                      child: Consumer<product_prove>(
                        builder: (context, value, child) {
                          return Image.network(
                            value.list_products[1].image_url,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(left: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.previousPage(
                                        duration: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                          Container(
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff272727).withOpacity(0.7)),
                            child: Container(
                                margin: EdgeInsets.only(right: 4),
                                child: InkWell(
                                  onTap: () {
                                    nextpage.animateToPage(0,
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                dotpageview(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Consumer<product_prove>(
                    builder: (context, value, child) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, bottom: 30),
                            child: Text(
                              value.list_products[0].kind,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Text(
                                    value.list_products[0].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: Text(
                                    value.list_products[0].price.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SELECT SIZE (UK Size)",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 46,
                              height: 28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffFCFCFC))),
                              child: InkWell(
                                onTap: () {
                                  print("object");
                                },
                                child: Center(
                                  child: Text(
                                    "11",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
