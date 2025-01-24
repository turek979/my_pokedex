import 'package:flutter/material.dart';

//TODO implement this, for now screen change doesn't work with exported widget

class MyListTile extends StatefulWidget {
  const MyListTile(this.icon, this.text, this.function, {super.key});

  final void function;
  final String text;
  final IconData icon;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
        size: 26,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        widget.text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
      ),
      onTap: () {
        widget.function;
      },
    );
  }
}
