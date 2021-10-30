import 'dart:convert';

import 'package:esra_books/model/welcome.dart';
import 'package:http/http.dart';
// import 'package:news/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint
  //String api_key = "f5870d7b365c4c659bb58d83d7798c4c";

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=zhQn8sp06p1agtXa1jvEgdnAihXUEDMu";
  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Book>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['welcome'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Book> welcome =
          body.map((dynamic item) => Book.fromJson(item)).toList();

      return welcome;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
