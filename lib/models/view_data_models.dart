import 'package:flutter/material.dart';

RegExp regExpValidQryStr2 = RegExp(
  r"^[A-Za-z0-9&' ]+$",
  caseSensitive: false,
  multiLine: false,
);

class ItemValueModel {
  late IconData icon;
  late String title;
  String? subtitle;
  Color? subtitleColor;
  late double value;
  double? target;
  Color? color;
  GestureTapCallback? onTap;
  ItemValueModel(
      {required this.icon,
      required this.title,
      this.subtitle,
      this.subtitleColor,
      required this.value,
      this.target,
      this.color,
      this.onTap});
}

class GraphDataModel {
  late String legend;
  Color? legendColor;
  late List<GraphDataItem> data;
  GraphDataModel({required this.legend, this.legendColor, required this.data});
}

class GraphDataItem {
  late String xAxisValue;
  late double yAxisValue;
  GraphDataItem(this.xAxisValue, this.yAxisValue);
}
