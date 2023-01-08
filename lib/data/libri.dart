class Book {
  int id = 0;
  String author = '';
  String title = '';
  String type = '';
  Book(this.id, this.author, this.title, this.type);

  //Create Book Object from map
  Book.fromJson(Map<String, dynamic> bookMap) {
    id = bookMap['id'] ?? 0;
    author = bookMap['author'] ?? '';
    title = bookMap['title'] ?? '';
    type = bookMap['type'] ?? '';
  }

  //Trasform Book Object into map

  Map<String, dynamic> toJson() {
    return {'id': id, 'author': author, 'title': title, 'type': type};
  }
}
