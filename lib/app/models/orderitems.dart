import 'package:vania/vania.dart';

class Orderitems extends Model {
  int? orderItem;
  int? orderNum;
  String? prodId;
  int? quantity;
  int? size;

  Orderitems() {
    super.table("orderitems");
  }

  Orderitems.fromMap(Map<String, dynamic> map) {
    orderItem = map["order_item"];
    orderNum = map["order_num"];
    prodId = map["prod_id"];
    quantity = map["quantity"];
    size = map["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "order_item": orderItem,
      "order_num": orderNum,
      "prod_id": prodId,
      "quantity": quantity,
      "size": size
    };
  }
}
