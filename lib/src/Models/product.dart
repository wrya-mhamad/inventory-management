import 'dart:ffi';

class Product {
  String? name;
  String? barcode;
  String? category;
  String? desc;
  int? quantity;
  Float? cost;
  Float? price;
  DateTime? manufactureDate;
  DateTime? expireDate;
  String? image;

  Product(
      {this.name,
      this.barcode,
      this.category,
      this.desc,
      this.quantity,
      this.cost,
      this.price,
      this.manufactureDate,
      this.expireDate,
      this.image});

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json['name'],
        barcode: json['barcode'],
        category: json['category'],
        desc: json['desc'],
        quantity: json['quantity'],
        cost: json['cost'],
        price: json['cost'],
        manufactureDate: json['manufactureDate'],
        expireDate: json['expireDate'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "barcode": barcode,
        "category": category,
        "desc": desc,
        "quantity": quantity,
        "cost": cost,
        "price": price,
        "manufactureDate": manufactureDate,
        "expireDate": expireDate,
        "image": image,
      };
}
