import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seek_helpers_task/core/core.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  String _getInitials(String name) {
    return name
        .trim()
        .split(' ')
        .map((s) => s.isNotEmpty ? s[0] : '')
        .take(2)
        .join()
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        context.push('/userDetails', extra: user);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryFixed,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    _getInitials(user.name),
                    style: textTheme.titleMedium!.copyWith(
                      color: colorScheme.primaryFixedDim,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: textTheme.titleMedium),
                    Text(user.company.name, style: textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
