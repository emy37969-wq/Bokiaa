class Bestsellerresponse {
  int? status;
  String? message;
  BestSellerreData? data;

  Bestsellerresponse.fromjson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data =
        json["data"] == null ? null : BestSellerreData.fromjson(json["data"]);
  }
}

class BestSellerreData {
  List<product>? products;
  BestSellerreData.fromjson(Map<String, dynamic> json) {
    if (json["products"] != null) {
      products = [];
      json["products"].forEach((v) {
        products?.add(product.fromjson(v));
      });
    }
    
  }
}

class product {
  int? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  num? priceafterdiscount;
  int? stok;
  String? image;
  String? category;

  product.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    discount = json["discount"];
    priceafterdiscount = json["priceafterdiscount"];
    stok = json["stok"];
    image = json["image"];
    category = json["category"];
  }
}
