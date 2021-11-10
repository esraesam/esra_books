import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  String status;
  String copyright;
  int numResults;
  Results results;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": results.toJson(),
      };
}

class Results {
  Results({
    required this.bestsellersDate,
    required this.publishedDate,
    required this.publishedDateDescription,
    required this.previousPublishedDate,
    required this.nextPublishedDate,
    required this.lists,
  });

  DateTime bestsellersDate;
  DateTime publishedDate;
  String publishedDateDescription;
  DateTime previousPublishedDate;
  String nextPublishedDate;
  List<ListElement> lists;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        publishedDateDescription: json["published_date_description"],
        previousPublishedDate: DateTime.parse(json["previous_published_date"]),
        nextPublishedDate: json["next_published_date"],
        lists: List<ListElement>.from(
            json["lists"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestsellers_date":
            "${bestsellersDate.year.toString().padLeft(4, '0')}-${bestsellersDate.month.toString().padLeft(2, '0')}-${bestsellersDate.day.toString().padLeft(2, '0')}",
        "published_date":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "published_date_description": publishedDateDescription,
        "previous_published_date":
            "${previousPublishedDate.year.toString().padLeft(4, '0')}-${previousPublishedDate.month.toString().padLeft(2, '0')}-${previousPublishedDate.day.toString().padLeft(2, '0')}",
        "next_published_date": nextPublishedDate,
        "lists": List<dynamic>.from(lists.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.listId,
    required this.listName,
    required this.listNameEncoded,
    required this.displayName,
    this.listImage,
    required this.books,
  });

  int listId;
  String listName;
  String listNameEncoded;
  String displayName;
  dynamic listImage;
  List<Book> books;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        listId: json["list_id"],
        listName: json["list_name"],
        listNameEncoded: json["list_name_encoded"],
        displayName: json["display_name"],
        listImage: json["list_image"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_id": listId,
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "display_name": displayName,
        "list_image": listImage,
        "books": List<dynamic>.from(
          books.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Book {
  Book({
    required this.author,
    required this.bookImage,
    required this.description,
    required this.firstChapterLink,
    required this.price,
    required this.primaryIsbn10,
    required this.bookUri,
    required this.publisher,
    required this.title,
    required this.rank,
  });

  String author;
  String bookImage;

  String description;
  String firstChapterLink;
  String price;
  String primaryIsbn10;

  String bookUri;
  String publisher;
  String title;
  int rank;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        author: json["author"],
        bookImage: json["book_image"],
        description: json["description"],
        firstChapterLink: json["first_chapter_link"],
        price: json["price"],
        primaryIsbn10: json["primary_isbn10"],
        bookUri: json["book_uri"],
        publisher: json["publisher"],
        title: json["title"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "first_chapter_link": firstChapterLink,
        "price": price,
        "primary_isbn10": primaryIsbn10,
        "book_uri": bookUri,
        "publisher": publisher,
        "title": title,
        "rank": rank,
      };
}

class BuyLink {
  BuyLink({
    required this.name,
    required this.url,
  });

  Name? name;
  String url;

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: nameValues.map![json["name"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "url": url,
      };
}

enum Name {
  AMAZON,
  APPLE_BOOKS,
  BARNES_AND_NOBLE,
  BOOKS_A_MILLION,
  BOOKSHOP,
  INDIE_BOUND
}

final nameValues = EnumValues({
  "Amazon": Name.AMAZON,
  "Apple Books": Name.APPLE_BOOKS,
  "Barnes and Noble": Name.BARNES_AND_NOBLE,
  "Bookshop": Name.BOOKSHOP,
  "Books-A-Million": Name.BOOKS_A_MILLION,
  "IndieBound": Name.INDIE_BOUND
});

enum Updated { WEEKLY, MONTHLY }

final updatedValues =
    EnumValues({"MONTHLY": Updated.MONTHLY, "WEEKLY": Updated.WEEKLY});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
