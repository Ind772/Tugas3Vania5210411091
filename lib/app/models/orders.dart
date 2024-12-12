import 'package:vania/vania.dart';

class Orders extends Model {
  int? orderNum;
  DateTime? orderDate;
  String? custId;

  Orders() {
    super.table("orders");
  }

  Orders.fromMap(Map<String, dynamic> map) {
    orderNum = map["order_num"];
    orderDate =
        map["order_date"] != null ? DateTime.parse(map['order_date']) : null;
    custId = map["cust_id"];
  }

  Map<String, dynamic> toMap() {
    return {
      "order_num": orderNum,
      "order_date": orderDate?.toString(),
      "cust_id": custId
    };
  }
}
