import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/users/user.dart';
import '../routes/app_pages.dart';
import '../services/profile_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User currentUser = ProfileService.currentUser;
    return Drawer(
      elevation: 4.0,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(currentUser.name!),
            currentAccountPicture:
                const Image(image: AssetImage('assets/moon.png')),
            accountEmail: const Text(''),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined,
                color: context.theme.iconTheme.color),
            title: Text('settings'.tr),
            onTap: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
        ],
      ),
    );
  }
}
