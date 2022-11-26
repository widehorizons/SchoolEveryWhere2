import 'package:flutter/material.dart';

import '../config/theme/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4.0,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          DrawerHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [],
            ),
          ),

          // ListTile(
          //   leading: const Icon(Icons.logout),
          //   title: const Text('Log Out'),
          //   onTap: () {
          //     Prefs.clear();
          //     Get.offAllNamed(Routes.AUTH);
          //   },
          // ),
        ],
      ),
    );
  }
}
