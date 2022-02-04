class LiteData {
  // ignore: non_constant_identifier_names
  List<String> Fields = [];
  // ignore: non_constant_identifier_names
  List<List<dynamic>> RowValues = [];
  List<Map<String, dynamic>> _mappedData = [];

  LiteData({data, type}) {
    if (type == 1) {
      if (data != null) {
        Fields = List.unmodifiable(data["fields"]);
        RowValues = List.unmodifiable(data["rowValues"]);
      }
    } else {
      if (data.runtimeType.toString() ==
              '_InternalLinkedHashMap<String, dynamic>' ||
          data.runtimeType.toString() == "_JsonMap") {
        _mappedData.add(data);
      } else {
        _mappedData = data;
      }
    }
  }

  // ignore: non_constant_identifier_names
  List<Map<String, dynamic>> get Rows {
    if (_mappedData.isNotEmpty) return _mappedData;
    if (RowValues.isEmpty) return _mappedData;
    return toMapList();
  }

  dynamic get(String key, List<dynamic> row) {
    if (Fields.contains(key)) {
      return row[Fields.indexOf(key)];
    } else {
      throw Exception("Key not found");
    }
  }

  List<Map<String, dynamic>> toMapList() {
    try {
      if (_mappedData.isNotEmpty) return _mappedData;
      if (RowValues.isEmpty) return _mappedData;

      //List<Map<String, dynamic>> list = [];
      int fieldLength = Fields.length;
      Map<String, dynamic> row;
      if (fieldLength > 0) {
        for (var valueArr in RowValues) {
          row = <String, dynamic>{};
          for (var i = 0; i < fieldLength; i++) {
            row.putIfAbsent(Fields[i], () => valueArr[i]);
          }
          _mappedData.add(row);
        }
        return _mappedData;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  List<Map<String, dynamic>> toJsonEntityList(data) {
    try {
      if (_mappedData.isNotEmpty) return _mappedData;
      if (RowValues.isEmpty) return _mappedData;

      int fieldLength = data["fields"].length;
      Map<String, dynamic> row;
      if (fieldLength > 0) {
        for (var valueArr in data["rowValues"]) {
          row = <String, dynamic>{};
          for (var i = 0; i < fieldLength; i++) {
            row.putIfAbsent(data["fields"][i], () => valueArr[i]);
          }
          _mappedData.add(row);
        }
        return _mappedData;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
