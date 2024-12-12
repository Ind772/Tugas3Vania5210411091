import 'package:vania/vania.dart';

class Customers extends Model {
  String? custId;
  String? custName;
  String? custAddress;
  String? custCity;
  String? custState;
  String? custZip;
  String? custCountry;
  String? custTelp;

  Customers() {
    super.table("customers");
  }

  Customers.fromMap(Map<String, dynamic> map) {
    custId = map["cust_id"];
    custName = map["cust_name"];
    custAddress = map["cust_address"];
    custCity = map["cust_city"];
    custState = map["cust_state"];
    custZip = map["cust_zip"];
    custCountry = map["cust_country"];
    custTelp = map["cust_telp"];
  }

  Map<String, dynamic> toMap() {
    return {
      "cust_id": custId,
      "cust_name": custName,
      "cust_address": custAddress,
      "cust_city": custCity,
      "cust_state": custState,
      "cust_zip": custZip,
      "cust_country": custCountry,
      "cust_telp": custTelp
    };
  }
}
