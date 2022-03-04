import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/widgets.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => homes_screen();
}

class homes_screen extends State<home> {
  List users = [];
  final String apiUrl = "http://restapi.adequateshop.com/api/Feed/GetNewsFeed";

  Future<List<dynamic>> fetchUsers() async {
    var response = await http.get(
      Uri.parse(apiUrl),
    );
    return json.decode(response.body);
  }

  fetchUser() async {
    var response = await http.get(
        Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json"));
    print(response.body);
    print(response.headers);
    print(response.request);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List items = json.decode(response.body);
      setState(() {
        users = items;
      });
    } else {
      users = [];
    }
  }

  String _name(
    dynamic user,
  ) {
    return user['name']['title'];
  }

  List<dynamic> listss = [
    {
      'image': "assets/img/list2.gif",
    },
    {
      'image': "assets/img/list3.gif",
    },
    {
      'image': "assets/img/list4.jpg",
    },
    {
      'image': "assets/img/list5.gif",
    }
  ];
  List<dynamic> cates = [
    {
      'title': 'clearance sale',
      'image': "assets/img/first.jfif",
    },
    {
      'title': 'Luxury store',
      'image': "assets/img/second.jpg",
    },
    {
      'title': 'Elite offers',
      'image': "assets/img/three1.jpg",
    },
    {
      'title': 'Newbies',
      'image': "assets/img/four.jpg",
    },
    {
      'title': 'offers',
      'image': "assets/img/three1.jpg",
    },
    {
      'title': 'categories',
      'image': "assets/img/three1.jpg",
    },
    {
      'title': 'Beauty studio',
      'image': "assets/img/three1.jpg",
    },
  ];
  List<dynamic> cates1 = [
    {
      'title': 'NY BAe Sunset Skyline Blush',
      'image': "assets/img/pro1.jpg",
      "subtitle1": "₹324",
      "subtitle2": "349",
      "subtitle3": "9% off"
    },
    {
      'title': 'ny bae confession lipstick',
      'image': "assets/img/pro2.jpg",
      "subtitle1": "₹234",
      "subtitle2": "299",
      "subtitle3": "9% off"
    },
    {
      'title': 'ny bae foundation concealer stick',
      'image': "assets/img/pro1.jpg",
      "subtitle1": "₹224",
      "subtitle2": "249",
      "subtitle3": "9% off"
    },
    {
      'title': 'Newbies',
      'image': "assets/img/four.jpg",
      "subtitle1": "₹224",
      "subtitle2": "249",
      "subtitle3": "9% off"
    },
    {
      'title': 'offers',
      'image': "assets/img/three1.jpg",
      "subtitle1": "₹224",
      "subtitle2": "249",
      "subtitle3": "9% off"
    },
  ];
  late PageController _pageController;
  late Timer _timer;
  List<String> images = [
    "assets/img/gif2.gif",
    "assets/img/gif1.gif",
    "assets/img/gif13.gif",
    "assets/img/gif14.gif",
    "assets/img/gif115.gif"
  ];

  int activePage = 0;

  int pageIndex = 0;

  void initState() {
    super.initState();
    fetchUser();
    _pageController = PageController(viewportFraction: 12, initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (activePage < 5) {
        activePage++;
      } else {
        activePage = 0;
      }

      _pageController.animateToPage(
        activePage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: Text(widget.title),
            // ),
            body: CustomScrollView(slivers: <Widget>[
      SliverPersistentHeader(
        floating: true,
        delegate: SliverAppBarDelegate(
            minHeight: 50,
            maxHeight: 50,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: ImageIcon(
                      AssetImage("assets/img/cate.jpg"),
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                  Container(
                      height: 60,
                      width: 130,
                      child: Image.asset("assets/img/puplesplash1.jfif")),
                  Padding(
                      padding: EdgeInsets.only(left: 85),
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.grey.shade700,
                          ),
                          iconSize: 30,
                          onPressed: () {},
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ImageIcon(
                      AssetImage(
                        "assets/img/smile1.png",
                      ),
                      //color: Color(0xFF3A5A98),
                    ),
                  ),
                ],
              ),
            )),
      ),
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          minHeight: 75.0,
          maxHeight: 70.0,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 0),
                  child: Container(
                      height: 40,
                      margin:
                          EdgeInsets.symmetric(horizontal: 13.0, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 2, //spread radius
                            blurRadius: 5, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                          //you can set more BoxShadow() here
                        ],
                      ),
                      child: Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 10.0, top: 10, bottom: 5),
                            child: Icon(Icons.search)),
                        Expanded(
                            child: TextFormField(
                                decoration: InputDecoration(
                          hintText: "what are you looking for?",
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                          ),
                          border: InputBorder.none,
                        )))
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
      // SliverList(delegate: SliverChildListDelegate(
      //
      //     List.generate(cates.length, (idx) {
      //       return Padding(
      //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      //         child:Cata()
      //
      //
      //       );
      //     })
      // ))
      SliverList(
        delegate: SliverChildListDelegate(
          [
            new Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 130.0,
                    // width: 90,
                    child:
                        // Container(
                        //   child: FutureBuilder<List<dynamic>>(
                        //     future: fetchUsers(),
                        //     builder:
                        //         (BuildContext context, AsyncSnapshot snapshot) {
                        //       if (snapshot.hasData) {
                        //         print(_name(snapshot.data[0]));
                        //         return
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(8),
                            itemCount: users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: Container(
                                    width: 80,
                                    // color: Colors.pink,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                            child: new Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: new BoxDecoration(
                                                  color: Colors.purple,
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: new NetworkImage(
                                                          users[index]
                                                              ['image_link'])),
                                                ))),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        new Text(
                                          users[index]['name'],
                                          // style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    )),
                              );
                            }),

                    // },
                  ),
                ),
                //),
                // ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 250,
                    child: PageView.builder(
                        itemCount: images.length,
                        pageSnapping: true,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            activePage = page;
                          });
                        },
                        itemBuilder: (context, pagePosition) {
                          bool active = pagePosition == activePage;
                          return slider(images, pagePosition, active);
                        }),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: indicators(images.length, activePage))
                ],
              ),
            ),
            // Column(
            //   children: [
            //     Expanded(
            //       child: SizedBox(
            //         width: 500,
            //         height: 300,
            //         child: ListView.builder(
            //             itemCount: listss.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               return Container(
            //                   decoration: new BoxDecoration(
            //                       image: new DecorationImage(
            //                 image: new AssetImage(listss[index]["image"]),
            //                 fit: BoxFit.fill,
            //               )));
            //             }),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate(List.generate(listss.length, (idx) {
        return Padding(
          padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
          child: Container(
              width: 100,
              // color: Colors.pink,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: new Container(
                        width: 350.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                            color: Colors.purple,
                            // shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage(listss[idx]["image"])))),
                  ),
                ],
              )),
        );
      }))),

      SliverList(
        delegate: SliverChildListDelegate(
          [
            new Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 280.0,
                    width: 90,
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cates1.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 7),
                          child: Container(
                            width: 150,
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        bottom: 10,
                                        right: 10,
                                        top: 20),
                                    child: Container(
                                      width: 130,
                                      height: 140,
                                      child:
                                          Image.asset(cates1[index]["image"]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        bottom: 10,
                                        right: 10,
                                        top: 10),
                                    child: Text(cates1[index]["title"] + "..."),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        bottom: 10,
                                        right: 10,
                                        top: 10),
                                    child: Row(children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                            right: 4,
                                          ),
                                          child: Text(
                                            cates1[index]["subtitle1"],
                                            style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            right: 8,
                                          ),
                                          child: Text(
                                            cates1[index]["subtitle2"],
                                            style: new TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          )),
                                      Text(
                                        cates1[index]["subtitle3"],
                                        style: new TextStyle(
                                          color: Colors.pink,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildListDelegate(
          List.generate(cates1.length, (index) {
            return Padding(
              padding: EdgeInsets.only(left: 7),
              child: Container(
                width: 250,
                height: 280,
                //  height: 200,
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 0, right: 10, top: 20),
                        child: Container(
                          width: 130,
                          height: 140,
                          child: Image.asset(cates1[index]["image"]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 0, right: 10, top: 10),
                        child: Text(cates1[index]["title"] + "..."),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 10, right: 10, top: 10),
                        child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                right: 4,
                              ),
                              child: Text(
                                cates1[index]["subtitle1"],
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                right: 8,
                              ),
                              child: Text(
                                cates1[index]["subtitle2"],
                                style: new TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )),
                          Text(
                            cates1[index]["subtitle3"],
                            style: new TextStyle(
                              color: Colors.pink,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      // SliverList(
      //     delegate: SliverChildListDelegate(List.generate(listss.length, (idx) {
      //   return Padding(
      //       padding: EdgeInsets.only(left: 10, bottom: 10),
      //       child: Column(
      //         // crossAxisAlignment: CrossAxisAlignment.start,
      //         // mainAxisAlignment: MainAxisAlignment.start,
      //         children: <Widget>[
      //           new GridView.count(
      //               crossAxisCount: 2,
      //               children: List.generate(cates1.length, (index) {
      //                 return Padding(
      //                   padding: EdgeInsets.only(left: 7),
      //                   child: Container(
      //                     width: 150,
      //                     child: Card(
      //                       child: Column(
      //                         children: [
      //                           Padding(
      //                             padding: EdgeInsets.only(
      //                                 left: 10, bottom: 10, right: 10, top: 20),
      //                             child: Container(
      //                               width: 130,
      //                               height: 130,
      //                               child: Image.asset(cates1[index]["image"]),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(
      //                                 left: 10, bottom: 10, right: 10, top: 10),
      //                             child: Text(cates1[index]["title"] + "..."),
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.only(
      //                                 left: 10, bottom: 10, right: 10, top: 10),
      //                             child: Row(children: [
      //                               Padding(
      //                                   padding: EdgeInsets.only(
      //                                     right: 4,
      //                                   ),
      //                                   child: Text(
      //                                     cates1[index]["subtitle1"],
      //                                     style: new TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 15,
      //                                     ),
      //                                   )),
      //                               Padding(
      //                                   padding: EdgeInsets.only(
      //                                     right: 8,
      //                                   ),
      //                                   child: Text(
      //                                     cates1[index]["subtitle2"],
      //                                     style: new TextStyle(
      //                                       color: Colors.grey,
      //                                       decoration:
      //                                           TextDecoration.lineThrough,
      //                                     ),
      //                                   )),
      //                               Text(
      //                                 cates1[index]["subtitle3"],
      //                                 style: new TextStyle(
      //                                   color: Colors.pink,
      //                                   fontSize: 15,
      //                                   decoration: TextDecoration.lineThrough,
      //                                 ),
      //                               ),
      //                             ]),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               }))
      //         ],
      //       ));
      // }))),
    ])));
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class Catagory extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final String image_catagory;

  Catagory(
      {required this.image_location,
      required this.image_caption,
      required this.image_catagory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: () {
          print("$image_catagory"); //Print tapped image_caption
        },
        child: Container(
          width: 8.0,
          color: Colors.white,
          child: ListTile(
            title: CircleAvatar(
              //Circle with gold border
              radius: 27.0,
              backgroundColor: Color(0xFFDEB992),
              child: CircleAvatar(
                //Circle which containes the icon
                radius: 27.0,
                backgroundColor: Colors.yellow,
                child: Image.asset(image_location),
              ),
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              height: 18.0,
              child: Text(
                image_caption,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Cata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")))),
              new Text("John Doe", textScaleFactor: 1.5)
            ],
          ));
        });
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = 4;

  return AnimatedContainer(
      // width: 350,
      height: 400,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            images[pagePosition],
          ),
        ),
      ));
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 400,
        height: 600,
        child: widget,
      );
    },
    child: Container(
      width: 200,
      //  margin: EdgeInsets.all(10),
      child: Image.asset(
        images[pagePosition],
        fit: BoxFit.fill,
      ),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.pink : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

class lisst extends StatelessWidget {
  List<dynamic> listss = [
    {
      'image': "assets/img/list2.gif",
    },
    {
      'image': "assets/img/list3.gif",
    },
    {
      'image': "assets/img/list4.jpg",
    },
    {
      'image': "assets/img/list5.gif",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listss.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Container(
                width: 100,
                // color: Colors.pink,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: new Container(
                          width: 350.0,
                          height: 130.0,
                          decoration: new BoxDecoration(
                              color: Colors.purple,
                              // shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      new AssetImage(listss[index]["image"])))),
                    ),
                  ],
                )),
          );
        },
      ),
    ]);
  }
}
