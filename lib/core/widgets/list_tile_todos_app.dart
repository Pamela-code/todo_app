// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../colors.dart';

class ListTileTodosApp extends StatefulWidget {
  const ListTileTodosApp({
    Key? key,
    required this.deleteOnPressed,
    required this.checkOnPressed,
    required this.done,
    required this.todoDescription,
  }) : super(key: key);
  final VoidCallback? deleteOnPressed;
  final VoidCallback? checkOnPressed;
  final bool done;
  final String todoDescription;

  @override
  State<ListTileTodosApp> createState() => _ListTileTodosAppState();
}

class _ListTileTodosAppState extends State<ListTileTodosApp> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        fillColor: MaterialStateColor.resolveWith((states) => secondaryColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
        value: widget.done,
        onChanged: (x) {
          widget.checkOnPressed!();
        },
      ),
      title: Text(widget.todoDescription),
      trailing: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: widget.deleteOnPressed),
    );
  }
}
