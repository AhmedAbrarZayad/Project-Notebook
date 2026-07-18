import 'package:flutter/material.dart';
import 'package:frontend/constants/strings/app_constants.dart';
import 'package:frontend/core/components/app_bar/title.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      leading: Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: IconButton(
          onPressed: () => {

          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      title: AppTitle(
        title: APP_TITLE,
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(100);
}