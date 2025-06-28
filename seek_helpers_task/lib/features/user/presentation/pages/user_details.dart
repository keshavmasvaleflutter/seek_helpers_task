import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seek_helpers_task/core/core.dart';

class UserDetails extends StatelessWidget {
  final User user;
  const UserDetails({super.key, required this.user});

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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.onSecondary.withAlpha(220),
                    colorScheme.primaryFixed.withAlpha(220),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Back Button
                  Padding(
                    padding: EdgeInsets.only(left: 12.w, top: 20.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: BackButton(onPressed: () => context.pop(), style: ButtonStyle(iconColor: WidgetStatePropertyAll(colorScheme.primaryFixedDim),),),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    width: 90.w,
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.onSecondary,
                      border: Border.all(
                        color: colorScheme.primaryFixedDim,
                        width: 2.w,
                      ),
                    ),
                    child: Text(
                      _getInitials(user.name),
                      style: textTheme.headlineLarge!.copyWith(
                        color: colorScheme.primaryFixedDim,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(user.name, style: textTheme.headlineMedium!.copyWith(color: colorScheme.primaryFixedDim)),
                  Text('@${user.username}', style: textTheme.bodyMedium!.copyWith(color: colorScheme.primaryFixedDim)),

                  // Email Badge
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorScheme.primaryFixedDim,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(user.email, style: textTheme.bodyMedium!.copyWith(color: colorScheme.primaryFixedDim)),
                  ),
                ],
              ),
            ),

            // Details Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 24.w),
                      SizedBox(width: 12.w),
                      Text(
                        "Personal Information",
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Divider(height: 24.h),
                  // User Details
                  CustomRowText(text1: "Full Name", text2: user.name),
                  CustomRowText(text1: "Username", text2: user.username),
                  CustomRowText(text1: "Email", text2: user.email),
                  CustomRowText(text1: "Phone", text2: user.phone),
                  CustomRowText(text1: "Website", text2: user.website),
                  CustomRowText(text1: "Company", text2: user.company.name),
                ],
              ),
            ),
            Container(
              height: 128.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Complete Address", style: textTheme.titleMedium),
                  Divider(height: 10.h),
                  Text(
                    "${user.address.street}, ${user.address.suite}, ${user.address.city} ${user.address.zipcode}",
                    style: textTheme.bodyMedium,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}",
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
