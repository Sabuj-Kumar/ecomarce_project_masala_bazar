import 'package:flutter/material.dart';

class ButtonStyleComponent {
  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
      side: const BorderSide(color: Colors.white),
    ),
  );

  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    primary: Colors.black,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 50),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.white,
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return const BorderSide(
            color: Colors.black,
            width: 2,
          );
        }
        return const BorderSide(
          color: Colors.black,
          width: 2,
        );
      },
    ),
  );
}
