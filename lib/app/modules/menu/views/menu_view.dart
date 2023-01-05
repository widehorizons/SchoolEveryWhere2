import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            iconTheme: IconThemeData(
              color: context.iconColor,
            ),
            actions: const [],
          ),
          drawer: const CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const DayNightGreetingBanner(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              '${DayNightGreetingBanner.getGreeting()} ,\n Moustafa',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      left: 20,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 50,
                          width: context.width * .8,
                          color: Colors.white.withAlpha(92),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: AppColors.gray1,
                                height: 25,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextField(
                                controller: controller.code,
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
                Center(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    itemCount: 8,
                    itemBuilder: (ctx, i) {
                      return Card(
                        elevation: 10,
                        child: Container(
                          // height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    'Title',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 264,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
