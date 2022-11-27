import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4.0,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('Mostafa'),
            currentAccountPicture:
                const Image(image: AssetImage('assets/moon.png')),
            accountEmail: Text(
              "Mostafa@WideHorizons.net",
              style: context.textTheme.labelMedium!
                  .copyWith(color: AppColors.white),
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
