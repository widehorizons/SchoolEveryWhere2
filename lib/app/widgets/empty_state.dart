import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmptyState extends StatelessWidget {
  const EmptyState(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.svgPath});
  final String title;
  final String subTitle;
  final String svgPath;

  factory EmptyState.noResult() => EmptyState(
        title: 'no_result_title'.tr,
        subTitle: 'no_result_body'.tr,
        svgPath: 'assets/icons/no_results.svg',
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 250, child: SvgPicture.asset(svgPath)),
          Text(
            title,
            style: context.textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
            child: Text(
              subTitle,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
