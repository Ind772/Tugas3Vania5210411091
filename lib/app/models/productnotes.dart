import 'package:vania/vania.dart';

class Productnotes extends Model {
  String? noteId;
  String? prodId;
  DateTime? noteDate;
  String? noteText;

  Productnotes() {
    super.table("productnotes");
  }

  Productnotes.fromMap(Map<String, dynamic> map) {
    noteId = map["note_id"];
    prodId = map["prod_id"];
    noteDate =
        map["note_date"] != null ? DateTime.parse(map['note_date']) : null;
    noteText = map["note_text"];
  }

  Map<String, dynamic> toMap() {
    return {
      "note_id": noteId,
      "prod_id": prodId,
      "note_date": noteDate?.toString(),
      "note_text": noteText
    };
  }
}
