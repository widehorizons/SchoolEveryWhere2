import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';
import '../../../services/profile_service.dart';
import '../../../widgets/app_loading_widget.dart';
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
                              '${DayNightGreetingBanner.getGreeting()} ,\n ${ProfileService.currentUser.name}',
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
                  child: Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Center(
                              child: (controller.loading.value)
                                  ? const AppLoadingWidget()
                                  : GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      itemCount: controller.icons.length,
                                      primary: false,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 140,
                                      ),
                                      itemBuilder: (ctx, i) {
                                        final icon = controller.icons[i];
                                        return Card(
                                          elevation: 8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Image.network(
                                                      icon.imageURL,
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    icon.title,
                                                    textAlign: TextAlign.start,
                                                    style: context
                                                        .textTheme.titleSmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
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
                    ),
                  ))
            ])),
      ),
    );
  }
}
