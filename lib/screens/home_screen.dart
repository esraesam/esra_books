import 'dart:convert';
import 'package:esra_books/common/constants.dart';
import 'package:esra_books/model/welcome.dart';
import 'package:esra_books/screens/book_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController user = TextEditingController();

  var image = '';

  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      image = preferences.getString('img')!;
    });

    print(image);
  }

  var loading = false;

  //this is a function that fetches the json and returns a list
  Future<Welcome> _fetchData() async {
    setState(() {
      loading = true;
    });
    var list;
    final response = await http.get(Uri.parse(
        "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=zhQn8sp06p1agtXa1jvEgdnAihXUEDMu"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //print(data);
      list = Welcome.fromJson(data);

      loading = false;
    }
    return list;
  }

  late Future<Welcome> _listModel;

  @override
  void initState() {
    super.initState();

    _listModel = _fetchData();
  }

  final TextEditingController _textController = new TextEditingController();

  void _clearTextField() {
    _textController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;

    return Scaffold(
      body: Container(
        child: FutureBuilder<Welcome>(
            future: _listModel,
            builder: (context, AsyncSnapshot<Welcome> snapshot) {
              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => BookDetail()));
                            },
                            child: Text(
                              "Esra Books",
                              style: GoogleFonts.notoSerif(
                                textStyle: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8),
                          //   child: Image.asset('image'),
                          //),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'It\'s Reading\ntime',
                            style: TextStyle(fontSize: 38),
                          ),
                          Image.asset(
                            'images/RectangleImg.png',
                            width: screenWidth * 0.3,
                            // height: screenHeight * 0.3,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.08,
                      child: TextField(
                        controller: _textController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                        ),
                        decoration: InputDecoration(
                          fillColor: kPrimaryColorLight,
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.search, color: kPrimaryColor),
                          suffixIcon: _textController.text.length == 0
                              ? null
                              : IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: _clearTextField,
                                ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 3, // length of tabs
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                physics: BouncingScrollPhysics(),
                                //isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorColor: kPrimaryColor,
                                labelColor: kPrimaryColor,
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Container(
                                    width: screenWidth * 0.32,
                                    child: Tab(text: 'All'),
                                  ),
                                  Container(
                                    width: screenWidth * 0.32,
                                    child: Tab(text: 'Newest'),
                                  ),
                                  Container(
                                    width: screenWidth * 0.32,
                                    child: Tab(text: 'Recommended'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  AllBooks(
                                    screenHeight: screenHeight,
                                    snapshot: snapshot,
                                  ),
                                  NewestTab(
                                    screenHeight: screenHeight,
                                    snapshot: snapshot,
                                  ),
                                  RecommendedTab(
                                    screenHeight: screenHeight,
                                    snapshot: snapshot,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class AllBooks extends StatelessWidget {
  const AllBooks({
    Key? key,
    required this.screenHeight,
    required this.snapshot,
  }) : super(key: key);

  final double? screenHeight;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return snapshot.data == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: snapshot.data!.results.lists.length,
            itemBuilder: (BuildContext context, int index) {
              return GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data!.results.lists[index].books.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index2) {
                  String title = snapshot
                      .data!.results.lists[index].books[index2].title
                      .toString();
                  String author = snapshot
                      .data!.results.lists[index].books[index2].author
                      .toString();
                  String price = snapshot
                      .data!.results.lists[index].books[index2].price
                      .toString();
                  String image = snapshot
                      .data!.results.lists[index].books[index2].bookImage
                      .toString();
                  String serialNo = snapshot
                      .data!.results.lists[index].books[index2].primaryIsbn10
                      .toString();
                  String publisher = snapshot
                      .data!.results.lists[index].books[index2].publisher
                      .toString();
                  int rank =
                      snapshot.data!.results.lists[index].books[index2].rank;
                  String description = snapshot
                      .data!.results.lists[index].books[index2].description;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetail(
                            title: title,
                            author: author,
                            price: price,
                            image: image,
                            serialNo: serialNo,
                            publisher: publisher,
                            rank: rank,
                            description: description,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // color: Colors.amber,
                      child: Image(
                        width: 200,
                        height: 200,
                        image: NetworkImage(image),
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}

class RecommendedTab extends StatelessWidget {
  const RecommendedTab({
    Key? key,
    required this.screenHeight,
    required this.snapshot,
  }) : super(key: key);

  final double? screenHeight;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data!.results.lists[0].books.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Image(
            width: 200,
            height: 200,
            image: NetworkImage(
              "${snapshot.data!.results.lists[0].books[index].bookImage}",
            ),
          ),
        );
      },
    );
  }
}

class NewestTab extends StatelessWidget {
  const NewestTab({
    Key? key,
    required this.screenHeight,
    required this.snapshot,
  }) : super(key: key);

  final double? screenHeight;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data!.results.lists[0].books.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          child: Image(
            width: 200,
            height: 200,
            image: NetworkImage(
              "${snapshot.data!.results.lists[0].books[index].bookImage}",
            ),
          ),
        );
      },
    );
  }
}
