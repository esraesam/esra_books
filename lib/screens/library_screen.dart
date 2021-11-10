import 'dart:convert';

import 'package:esra_books/common/constants.dart';
import 'package:esra_books/model/welcome.dart';
import 'package:esra_books/screens/book_detail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  Future<Welcome> _fetchData() async {
    setState(() {});
    var list;
    final response = await http.get(Uri.parse(
        "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=zhQn8sp06p1agtXa1jvEgdnAihXUEDMu"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //print(data);
      list = Welcome.fromJson(data);
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
    // Clear everything in the text field
    _textController.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: _listModel,
          builder: (context, AsyncSnapshot<Welcome> snapshot) {
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Book Library',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
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
                        color: Colors.black,
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
                        hintText: "Titles, authors or topics",
                        hintStyle: TextStyle(
                          fontSize: 16,
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
                    child: AllBooks(
                      screenHeight: screenHeight,
                      snapshot: snapshot,
                    ),
                  ),
                ],
              ),
            );
          }),
    ));
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
