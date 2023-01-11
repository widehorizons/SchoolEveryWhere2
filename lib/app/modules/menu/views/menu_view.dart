import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/theme/theme.dart';
import '../../../models/screen_icon.dart';
import '../../../services/profile_service.dart';
import '../../../widgets/app_loading_widget.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/day_night_greating.dart';
import '../../../widgets/empty_state.dart';
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
                    child: CustomSearchTextField(
                      controller: controller.code,
                      searchList: controller.icons,
                      query: (value) {
                        controller.query.value = value;
                      },
                      onClose: () {},
                      onChange: (value) {
                        controller.searchedList.clear();
                        controller.searchedList.addAll(value);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                  flex: 3,
                  child: Obx(
                    () => (controller.query.isNotEmpty &&
                            controller.searchedList.isEmpty)
                        ? EmptyState.noResult()
                        : SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Center(
                                    child: (controller.loading.value)
                                        ? const AppLoadingWidget()
                                        : MenuScreenBody(
                                            icons: controller
                                                    .searchedList.isNotEmpty
                                                ? controller.searchedList
                                                : controller.icons),
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

class MenuScreenBody extends StatelessWidget {
  const MenuScreenBody({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final List<ScreenIcon> icons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: icons.length,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 23,
        mainAxisExtent: 160,
      ),
      itemBuilder: (ctx, i) {
        final icon = icons[i];
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      icon.imageURL,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    icon.title,
                    textAlign: TextAlign.start,
                    style: context.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    Key? key,
    required this.controller,
    required this.searchList,
    required this.onChange,
    required this.query,
    this.onClose,
  }) : super(key: key);

  final List<ScreenIcon> searchList;
  final ValueChanged<List<ScreenIcon>> onChange;
  final ValueChanged<String> query;
  final TextEditingController controller;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              color: AppColors.secondaryTypoColor,
              height: 25,
            ),
          ),
          Expanded(
            flex: 4,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                query(value);
                final l = searchList
                    .where((element) => element.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
                onChange(l);
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: CloseButton(
                  color: AppColors.secondaryTypoColor,
                  onPressed: () {
                    controller.clear();
                    onClose?.call();
                    onChange(searchList);
                  },
                ),
              ),
            ),
          ),
          // Expanded(
          //     flex: 2,
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 5),
          //       child: CustomButton(
          //           child: Text(
          //             'search'.tr,
          //             style: context.textTheme.caption!
          //                 .copyWith(color: Colors.white),
          //           ),
          //           onPressed: () async {}),
          //     ))
        ]),
      ),
    );
  }
}
