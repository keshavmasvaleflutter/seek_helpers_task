import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowText extends StatelessWidget{
  final String text1;
  final String text2;

  const CustomRowText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Text(
            text1,
            style: textTheme.titleSmall!.copyWith(
              color: colorScheme.secondary,
            )
          ),
          const Spacer(),
          Text(
            text2,
            style: textTheme.titleSmall!.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}