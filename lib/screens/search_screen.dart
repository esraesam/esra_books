import 'dart:convert';

import 'package:esra_books/model/welcome.dart';
import 'package:esra_books/screens/category_detail.dart';
import 'package:esra_books/widget/category/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _BookLibraryState createState() => _BookLibraryState();
}

class _BookLibraryState extends State<SearchScreen> {
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

  void _clearTextField() {
    _textController.clear();
    setState(() {});
  }

  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData? _mediaQueryData = MediaQuery.of(context);
    double? screenHeight = _mediaQueryData.size.height;
    double? screenWidth = _mediaQueryData.size.width;
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Catagories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Expanded(
              child: FutureBuilder<Welcome>(
                future: _listModel,
                builder: (context, AsyncSnapshot<Welcome> snapshot) {
                  return snapshot.data == null
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: screenWidth,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 8.5),
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 16.0,
                            ),
                            itemCount: snapshot.data!.results.lists.length,
                            itemBuilder: (context, index) {
                              String categoryName = snapshot
                                  .data!.results.lists[index].displayName
                                  .toString();
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => CategoryDetail(
                                                snapshot: snapshot,
                                                categoryIndex: index,
                                                categoryName: categoryName,
                                              )));
                                },
                                child: CategoryItem(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  hint:
                                      "${snapshot.data!.results.lists[index].displayName}",
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
