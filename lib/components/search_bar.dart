import 'package:flutter/material.dart';
import '../icons_food_app.dart';

class SearchBarStless extends StatelessWidget {
  SearchBarStless(this.hint, {Key key}) : super(key: key);
  final String hint;

  final searchTextController = TextEditingController();
  void searchSubmit(String text) {
    searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      onSubmitted: searchSubmit,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        isCollapsed: true,
        border: InputBorder.none,
        prefixIcon: IconButton(
          color: Color(0xff858585),
          iconSize: 20,
          padding: EdgeInsets.only(left: 25, right: 21),
          icon: Icon(IconsFoodApp.bigSearch),
          onPressed: () => searchSubmit(searchTextController.text),
        ),
        hintStyle: TextStyle(
          color: Color(0xff454545),
        ),
        hintText: hint,
      ),
    );
  }
}
