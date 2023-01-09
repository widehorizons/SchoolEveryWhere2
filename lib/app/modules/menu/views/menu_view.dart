import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/Constants/prefs_keys.dart';
import '../../../config/theme/theme.dart';
import '../../../config/utils/prefs.dart';
import '../../../models/users/Student.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/day_night_greating.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: context.theme.copyWith(dividerColor: Colors.transparent),
        child: Scaffold(
            drawer: const CustomDrawer(),
            body: Column(children: <Widget>[
              Stack(
                children: [
                  const DayNightGreetingBanner(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: InkWell(
                          child: const Icon(
                            Icons.menu,
                            size: 26,
                            color: AppColors.white,
                          ),
                          onTap: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              '${DayNightGreetingBanner.getGreeting()} ,\n ${Student.fromJson(Prefs.getMap(PrefsKeys.currentUser)).name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: 50,
                        width: context.width * .8,
                        color: Colors.white.withAlpha(150),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: Colors.white,
                              height: 25,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: controller.code,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: CustomButton(
                                    child: Text(
                                      'search'.tr,
                                      style: context.textTheme.caption!
                                          .copyWith(color: Colors.white),
                                    ),
                                    onPressed: () async {}),
                              ))
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              itemCount: 8,
                              primary: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 160,
                              ),
                              itemBuilder: (ctx, i) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                'assets/moon.png',
                                              ),
                                            ),
                                            Text(
                                              'Title',
                                              style: context
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ])),
      ),
    );
  }
}
