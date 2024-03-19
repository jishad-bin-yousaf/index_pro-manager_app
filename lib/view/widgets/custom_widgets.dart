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