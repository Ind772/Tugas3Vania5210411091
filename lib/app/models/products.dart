import 'package:vania/vania.dart';

class Products extends Model {
  String? prodId;
  String? vendId;
  String? prodName;
  int? prodPrice;
  String? prodDesc;

  Products() {
    super.table("products");
  }

  Products.fromMap(Map<String, dynamic> map) {
    prodId = map["prod_id"];
    vendId = map["vend_id"];
    prodName = map["prod_name"];
    prodPrice = map["prod_price"];
    prodDesc = map["prod_desc"];
  }

  Map<String, dynamic> toMap() {
    return {
      "prod_id": prodId,
      "vend_id": vendId,
      "prod_name": prodName,
      "prod_price": prodPrice,
      "prod_desc": prodDesc
    };
  }
}
