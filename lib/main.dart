import 'dart:async';

import 'package:akkenna/Image_Path.dart';
import 'package:akkenna/commancolors.dart';
import 'package:akkenna/furit.dart';
import 'package:akkenna/scr/methods.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const akkena(),
    );
  }
}

class akkena extends StatefulWidget {
  const akkena({super.key});

  @override
  State<akkena> createState() => _akkenaState();
}

class _akkenaState extends State<akkena> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  int _currentPage = 0;
  final int _numPages = 3;
  final List<String> _pageContents = [
    '10% off ',
    '20% off ',
    '30% off',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentPage < _numPages - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _scrollToPage(_currentPage);
      });
    });
  }

  void _scrollToPage(int page) {
    _scrollController.animateTo(
      page * MediaQuery.of(context).size.width,
      duration: Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  List furits = ["apple", "orang", "grape"];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  Widget buildScrollableCards() {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: _numPages,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.grey,
          ),
          margin: EdgeInsets.only(right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._pageContents[index]
                        .split(', ')
                        .map((String item) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item,
                                style: TextStyle(
                                    color: item.contains('off')
                                        ? Colors.black
                                        : yellow1,
                                    fontSize: item.contains('off') ? 20 : 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              // Adjust the spacing as needed
                            ],
                          );
                        })
                        .expand((element) => [
                              element,
                            ]) // Add space between items
                        .toList(), // Adjust the spacing as needed
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                            'today only', // Add your additional text here
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Fresh ', // Additional text here
                                style: TextStyle(
                                    color: Colors.black, // Green color
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'Food',
                                style: TextStyle(
                                    color:
                                        blue55, // Set green color for the additional text
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'delivery ', // Additional text here
                                style: TextStyle(
                                    color: ggreen, // Green color
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'today',
                                style: TextStyle(
                                    color: Colors
                                        .black, // Set green color for the additional text
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: white1),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Order Now",
                              style: TextStyle(
                                  color:
                                      ggreen, // Set green color for the additional text
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  child: ImgPathPng("—Pngtree—supermarket shopping cart_1305115.png"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPaginationIndicators() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _numPages,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _currentPage == index ? 12.0 : 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: _currentPage == index ? Colors.blue : Colors.grey[300],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.menu, color: Colors.black, size: 25),
          ),
        ),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                // Handle location button press
              },
              icon: Icon(Icons.location_on_outlined, color: Colors.green, size: 25),
            ),
            Expanded(
              child: Text(
                'newyor west2dfew5', // Text to display next to the location icon
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            ),
          ],
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_down_rounded,
                color: Colors.black, size: 25),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 25),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black, size: 25),
          ),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 25),
                  ),
                  if (_counter > 0) // Display the count only if it's greater than 0
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red, // You can change the color here
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '$_counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
          // Your drawer content here
          ),
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white2,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 2, // Blur radius
                      offset: Offset(0, 4), // Shadow offset
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    buildScrollableCards(),
                    buildPaginationIndicators(),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: white1,
                ),
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ImgPathPng(
                            "recruiterImg.png",
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'About Our Farm & Farmers',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Organic is the way to go ',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
              ), // Add more containers or widgets here for additional items
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCustomContainer(context, "Client Rivew", "165k",
                          textColor: grey5, fixedTextColor: ggreen),
                      buildCustomContainer(context, "Store Time-Up", "30k",
                          textColor: grey5, fixedTextColor: ggreen),
                      buildCustomContainer(context, "Land Aceres", "200k",
                          textColor: grey5, fixedTextColor: ggreen),
                      buildCustomContainer(context, "Land Aceres", "80k",
                          textColor: grey5, fixedTextColor: ggreen),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fresh & Tastier Organic Products ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Text("See all",
                        style: TextStyle(
                            color: ggreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildCustomContainer2(
                              context: context,
                              text: "Fresh Root Vegetables",
                              pathPNG: "veggr.png"),
                          buildCustomContainer2(
                              context: context,
                              text: "Healty Cruciferous",
                              pathPNG: "brocoli.png"),
                          buildCustomContainer2(
                              context: context,
                              text: "Dry Fruit",
                              pathPNG: "veggr.png"),
                          buildCustomContainer2(
                              context: context,
                              text: "Fresh Root Vegetables",
                              pathPNG: "brocoli.png"),

                        ],
                      ),
                    ),

                    SizedBox(height: 5,),
                    Container(
                      width: double.infinity,
                      child: Center(
                        child: Text("Farm Fresh Products",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                      ),
                    ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: white1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("vegetable"
                        ,style: TextStyle(fontSize: 15),),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => fruit()),
                          );
                        },child: Text("fruits")),
                    SizedBox(width: 10,),
                    Text("spices"),
                    SizedBox(width: 10,),
                    Text("pickle"),
                    SizedBox(width: 10,),
                    Text("organic pickle"),
                    SizedBox(width: 10,),
                    Text("fruits"),
                    SizedBox(width: 10,),
                    Text("fruits"),
                    SizedBox(width: 10,),
                    Text("fruits"),



                  ],
                ),
              ),
            ),
              Container(
                  margin: EdgeInsets.only(
                      top: 10,bottom: 50),
                  height: MediaQuery.of(context).size.height /
                      3, // Adjust the height as needed
                  child: ListView.builder(

                      shrinkWrap: true,
                      itemCount: furits
                          .length, // Replace itemCount with your actual item count
                      itemBuilder: (BuildContext context, int index) {
                        // Replace this with your custom item builder
                        return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white1,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 80, // Set your desired width
                                      height: 110, // Set your desired height
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: grey1),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: ImgPathPng("16-rraspberry-png-image-thumb.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            furits[index],
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                                            overflow: TextOverflow.ellipsis, // Add this line
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "5.00/lb",
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items evenly
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: grey1,
                                                ),
                                                child: Text(
                                                  "Sized box",style: TextStyle(fontSize: 13)
                                                ),
                                              ),
                                            // Add some spacing between the containers
                                              Container(
                                                margin: EdgeInsets.only(right: 25),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.greenAccent,
                                                ),
                                                child: Text(
                                                  "Gross Weight :10KG",style: TextStyle(fontSize: 13),
                                                    textAlign: TextAlign.start,
                                                  overflow:TextOverflow.ellipsis ,
                                                ),
                                              ),
                                            ],
                                          ),
SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Container(

                                                height:40,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border:Border.all(color: green1)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color: Colors.green,
                                                        ),
                                                        onPressed: _decrementCounter,
                                                      ),
                                                    ),
                                                    Text(
                                                      '$_counter',
                                                      style: TextStyle(fontSize: 10),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: _incrementCounter,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              // Add some spacing between the containers
                                              Container(

                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.greenAccent,
                                                ),
                                                child: Text(
                                                  "Total Weight :10KG",style: TextStyle(fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ));
                      }))
            ],
          ),
        ),
            ],
          ),
        ),),
    );
  }
}
