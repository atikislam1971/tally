import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
     this.automaticallyImplyLeading=true,
    this.title,
    this.leading
  });

  final bool automaticallyImplyLeading;
  final Widget? title;
  final Widget? leading;



  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      centerTitle: false,
      leading:  leading ?? (automaticallyImplyLeading ==false
      ? null
          : IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back
          ))
      ),
      bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 1),
          child: Divider(
            color: Colors.black.withOpacity(.080),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
