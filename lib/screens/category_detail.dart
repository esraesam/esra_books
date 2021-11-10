import 'package:esra_books/common/constants.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({
    Key? key,
    required this.categoryIndex,
    this.snapshot,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;
  final int categoryIndex;
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$categoryName',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: snapshot.data!.results.lists[categoryIndex].books.length,
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
                    "${snapshot.data!.results.lists[categoryIndex].books[index].bookImage}",
                  ),
                ),
              );
            },
          ),
        ));
  }
}
