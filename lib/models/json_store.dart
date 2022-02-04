class JsonStore {
  // ignore: constant_identifier_names
  static const int JSONSTORE_TYPE_LOG = 1;

  late int id;
  late int tranType;
  late String tranNo;
  late String tranDate;
  late String jsonData;
  bool isSent = false;

  JsonStore(
      {required this.id,
      required this.tranType,
      required this.tranNo,
      required this.tranDate,
      required this.jsonData});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory JsonStore.fromMap(Map<String, dynamic> map) {
    return JsonStore(
      id: map['id'],
      tranNo: map['id'],
      tranDate: map['id'],
      tranType: map['id'],
      jsonData: map['id'],
    );
  }
}
