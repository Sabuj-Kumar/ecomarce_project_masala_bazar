// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// // ignore: implementation_imports
// import 'package:flutter_typeahead/src/cupertino_flutter_typeahead.dart';
// import 'dart:io';

// class CustomTypeAheadField extends StatefulWidget {
//   final SuggestionsCallback suggestionsCallback;

//   final SuggestionSelectionCallback onSuggestionSelected;

//   final ItemBuilder itemBuilder;

//   final CupertinoSuggestionsBoxDecoration? cupertinoSuggestionsBoxDecoration;

//   final SuggestionsBoxDecoration? suggestionsBoxDecoration;

//   final CupertinoSuggestionsBoxController? cupertinoSuggestionsBoxController;

//   final SuggestionsBoxController? suggestionsBoxController;

//   final Duration debounceDuration;

//   final WidgetBuilder? loadingBuilder;

//   final WidgetBuilder? noItemsFoundBuilder;

//   final ErrorBuilder? errorBuilder;

//   final AnimationTransitionBuilder? transitionBuilder;

//   final Duration animationDuration;

//   final AxisDirection direction;

//   final double animationStart;

//   final double suggestionsBoxVerticalOffset;

//   final bool getImmediateSuggestions;

//   final bool hideOnLoading;

//   final bool hideOnEmpty;

//   final bool hideOnError;

//   final bool hideSuggestionsOnKeyboardHide;

//   final bool keepSuggestionsOnLoading;

//   final bool keepSuggestionsOnSuggestionSelected;

//   final bool autoFlipDirection;

//   final TextEditingController? controller;

//   final String? label;

//   final Color? backgroundColor;

//   final Color? suggestionBoxColor;

//   const CustomTypeAheadField(
//       {Key? key,
//       required this.suggestionsCallback,
//       required this.itemBuilder,
//       required this.onSuggestionSelected,
//       this.cupertinoSuggestionsBoxDecoration,
//       this.suggestionsBoxDecoration,
//       this.debounceDuration = const Duration(milliseconds: 300),
//       this.cupertinoSuggestionsBoxController,
//       this.suggestionsBoxController,
//       this.loadingBuilder,
//       this.noItemsFoundBuilder,
//       this.errorBuilder,
//       this.transitionBuilder,
//       this.animationStart = 0.25,
//       this.animationDuration = const Duration(milliseconds: 500),
//       this.getImmediateSuggestions = false,
//       this.suggestionsBoxVerticalOffset = 5.0,
//       this.direction = AxisDirection.down,
//       this.hideOnLoading = false,
//       this.hideOnEmpty = false,
//       this.hideOnError = false,
//       this.hideSuggestionsOnKeyboardHide = true,
//       this.keepSuggestionsOnLoading = true,
//       this.keepSuggestionsOnSuggestionSelected = false,
//       this.autoFlipDirection = false,
//       this.controller,
//       this.label,
//       this.backgroundColor,
//       this.suggestionBoxColor,
//       })
//       : assert(animationStart >= 0.0 && animationStart <= 1.0),
//         assert(
//             direction == AxisDirection.down || direction == AxisDirection.up),
//         super(key: key);

//   @override
//   _CustomTypeAheadFieldState createState() => _CustomTypeAheadFieldState();
// }

// class _CustomTypeAheadFieldState extends State<CustomTypeAheadField> {
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isIOS) {
//       return CupertinoTypeAheadField(
//           autoFlipDirection: widget.autoFlipDirection,
//           debounceDuration: widget.debounceDuration,
//           suggestionsBoxDecoration: widget.cupertinoSuggestionsBoxDecoration ??
//               CupertinoSuggestionsBoxDecoration(
//                   color: widget.suggestionBoxColor ?? Colors.white,
//                   border: Border.all(
//                       color: widget.suggestionBoxColor ?? Colors.white)),
//           suggestionsBoxController: widget.cupertinoSuggestionsBoxController,
//           textFieldConfiguration: CupertinoTextFieldConfiguration(
//             controller: widget.controller,
//             prefix: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 widget.label!,
//                 style: TextStyle(
//                     color: Theme.of(context).textTheme.bodyText1!.color),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: widget.backgroundColor ??
//                   Theme.of(context).primaryColor.withOpacity(.1),
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             autofocus: false,
//             style:
//                 TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
//             // decoration: const InputDecoration(
//             //   border: OutlineInputBorder(),
//             // ),
//           ),
//           onSuggestionSelected: widget.onSuggestionSelected,
//           itemBuilder: widget.itemBuilder,
//           suggestionsCallback: widget.suggestionsCallback);
//     } else {
//       return TypeAheadField(
//         autoFlipDirection: widget.autoFlipDirection,
//         debounceDuration: widget.debounceDuration,
//         suggestionsBoxDecoration: widget.suggestionsBoxDecoration ??
//             SuggestionsBoxDecoration(
//                 color: widget.suggestionBoxColor ?? Colors.white, ),
//         suggestionsBoxController: widget.suggestionsBoxController,
//         textFieldConfiguration: TextFieldConfiguration(
//           controller: widget.controller,
//           autofocus: false,
//           textCapitalization: TextCapitalization.words,
//           decoration: InputDecoration(
//             labelText: widget.label,
//             labelStyle: TextStyle(
//               color: Theme.of(context).textTheme.bodyText1!.color,
//             ),
//             hintStyle: TextStyle(
//               color: Theme.of(context).textTheme.bodyText1!.color,
//             ),
//           ),
//           style: TextStyle(
//               color: Theme.of(context).textTheme.bodyText1!.color,
//               fontWeight: FontWeight.w400),
//         ),
//         suggestionsCallback: widget.suggestionsCallback,
//         itemBuilder: widget.itemBuilder,
//         onSuggestionSelected: widget.onSuggestionSelected,
//       );
//     }
//   }
// }


// CustomCard(
//                       child: CustomTypeAheadField(
//                         backgroundColor:
//                             Theme.of(context).primaryColor.withOpacity(.2),
//                         suggestionBoxColor: Theme.of(context)
//                             .scaffoldBackgroundColor
//                             .withOpacity(.9),
//                         controller: _typeAheadController,
//                         label: "Label: ",
//                         suggestionsCallback: (pattern) async {
//                           if (pattern != '' &&
//                               !regExpValidQryStr2.hasMatch(pattern)) {
//                             CustomToast.info(
//                                 message:
//                                     "Please enter valid value. Allowed special characters &' ");
//                             return [];
//                           }
//                           var result = [];
//                           for (var item in items) {
//                             if (item.title
//                                 .toUpperCase()
//                                 .contains(pattern.toUpperCase())) {
//                               result.add(item);
//                             }
//                           }
//                           return result;
//                         },
//                         itemBuilder: (context, suggestion) {
//                           ItemValueModel item = suggestion as ItemValueModel;
//                           return ListTile(
//                             leading: Icon(
//                               item.icon,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             focusColor: Colors.amber,
//                             title: Text(
//                               item.title,
//                               style: TextStyle(
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             // title: Text(suggestion['name']),
//                             // subtitle: Text('\$${suggestion['price']}'),
//                           );
//                         },
//                         onSuggestionSelected: (suggestion) {
//                           ItemValueModel item = suggestion as ItemValueModel;
//                           _typeAheadController.text = item.title;
//                         },
//                       ),
//                     ),