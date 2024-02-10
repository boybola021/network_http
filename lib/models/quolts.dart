
/// model

class Quote{
  int id;
  String quote;
  String author;
  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    id: json["id"],
    quote: json["quote"],
    author: json["author"],
  );
}

