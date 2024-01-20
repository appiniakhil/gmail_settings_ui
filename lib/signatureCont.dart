import 'package:flutter/material.dart';
import 'package:gmail_settings_ui/signature.dart';

class SignContainer extends StatefulWidget {
  SignContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignContainer();
  }
}

class _SignContainer extends State<SignContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Removed fixed width for the first container
          Container(
            child: Text(
              "Signature:",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          // Removed fixed width for the second container
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [Container(child: Signature())],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
