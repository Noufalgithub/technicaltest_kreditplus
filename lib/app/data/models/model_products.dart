// API URL : https://fakestoreapi.com/products

class ModelProducts {
  ModelProducts({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ModelProducts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ModelProducts copyWith({
    int? id,
    String? title,
    String? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) =>
      ModelProducts(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['description'] = description;
    map['category'] = category;
    map['image'] = image;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    return map;
  }
}

/// rate : 3.9
/// count : 120

class Rating {
  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(dynamic json) {
    rate = json['rate'].toString();
    count = json['count'];
  }

  String? rate;
  int? count;

  Rating copyWith({
    String? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['count'] = count;
    return map;
  }
}
