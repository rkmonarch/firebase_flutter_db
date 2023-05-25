import 'package:firebase_flutter_db/widgets/resource/app_colors.dart';
import 'package:firebase_flutter_db/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:logger/logger.dart';

Widget hSpaceTiny(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.001);
Widget hSpaceSmall(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.01);
Widget hSpaceMedium(BuildContext context) =>
    SizedBox(width: screenWidth(context) * 0.03);
Widget hSpaceLarge(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.05);
Widget hSpaceMassive(BuildContext context) =>
    SizedBox(width: deviceWidth(context) * 0.1);

Widget vSpaceTiny(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.001);
Widget vSpaceSmall(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.01);
Widget vSpaceMedium(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.03);
Widget vSpaceLarge(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.05);
Widget vSpaceMassive(BuildContext context) =>
    SizedBox(height: screenHeight(context) * 0.1);

Widget verticalSpace(double height) => SizedBox(height: height);

extension CustomContext on BuildContext {
  double screenHeight({double percent = 1}) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth({double percent = 1}) =>
      MediaQuery.of(this).size.width * percent;
}

Widget emptyBox() => const SizedBox.shrink();

AppBar noTitleAppBar({bool isLight = true, bool leading = true}) {
  return AppBar(
    automaticallyImplyLeading: leading,
    backgroundColor: Colors.transparent,
    iconTheme:
        IconThemeData(color: isLight ? AppColors.orange : Colors.white),
    elevation: 0,
    // ignore: deprecated_member_use
    brightness: isLight ? Brightness.light : Brightness.dark,
  );
}

class ShimmerWidget extends StatelessWidget {
  final bool isCircle;
  final double? radius;

  const ShimmerWidget({
    Key? key,
    required this.isCircle,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.orange,
      child: isCircle
          ? CircleAvatar(
              radius: radius ?? 30,
              backgroundColor: Colors.white,
            )
          : const SizedBox(
              height: 20,
              width: 50,
            ),
    );
  }
}

class ShimmerView extends StatelessWidget {
  const ShimmerView({
    Key? key,
    required this.thumbHeight,
    required this.thumbWidth,
  }) : super(key: key);

  final double thumbHeight;
  final double thumbWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: AppColors.orange,
            child: Container(
              height: thumbHeight,
              width: thumbWidth,
              color: Colors.white,
            ))
        .decorated(borderRadius: const BorderRadius.all(Radius.circular(12)))
        .padding(all: 8);
  }
}

// Screen Size helpers
Logger lg = Logger();

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
