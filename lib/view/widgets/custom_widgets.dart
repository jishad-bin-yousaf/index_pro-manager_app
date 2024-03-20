import 'package:flutter/material.dart';

class CustomWidgets {
  static Container customDivider(ThemeData theme, {Color? color}) {
    return Container(
      width: 40,
      height: 5,
      decoration: BoxDecoration(
        color: color ?? theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(top: 5, bottom: 15),
    );
  }

  static Color getStatusColor(String status) {
    return status.trim() == 'Success'.trim()
        ? const Color.fromRGBO(0, 124, 12, 1)
        : status.trim() == 'Pending'.trim()
            ? const Color.fromRGBO(0, 131, 107, 1)
            : status.trim() == 'Finish'.trim()
                ? const Color.fromRGBO(228, 171, 0, 1)
                : status.trim() == 'Cancelled'.trim()
                    ? Colors.deepOrange
                    : status.trim() == 'Failed'.trim()
                        ? const Color.fromRGBO(164, 0, 0, 1)
                        : Colors.blueAccent;
  }
  /* static InputDecoration textFieldDecoration({
    required String label,
    String? errorText,
    Widget? prefix,
    Widget? suffix,
  }) {
    return InputDecoration(
      label: Text(label),
      prefix: prefix,
      suffix: suffix,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      errorText: errorText,
      filled: true,
                  fillColor: theme.colorScheme.secondaryContainer,
    );
  }
   */
}
/* 
 InputDecoration(
                  
                
                  prefixIcon: const Icon(Icons.mail_outline),
                  prefixIconColor: theme.colorScheme.primary,
                  label: Text("Email")), */