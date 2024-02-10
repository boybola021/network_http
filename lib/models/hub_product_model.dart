
class HubProducts{
  int id;
  String discription;
  String name;
  String price;

  HubProducts({
   required this.id,
   required this.discription,
   required this.name,
   required this.price
  });

  factory HubProducts.fromJson(Map<String,Object?>json){
    return HubProducts(
        id: json["id"] as int,
        discription: json["description"] as String,
        name:  json["name"] as String,
        price:  json["price"]  as String,
    );
  }
  @override
  String toString() => "id: $id\nname:$name";
}