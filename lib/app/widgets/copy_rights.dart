import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme/theme.dart';

class CopyRights extends StatelessWidget {
  const CopyRights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'img/schooleverywhere.png',
          width: 50,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '© Powerd by SchoolEveryWhere™',
            style: context.textTheme.bodyMedium!
                .copyWith(height: 1.2, color: AppColors.primaryTypoColor),
          ),
        ),
      ],
    );
  }
}
