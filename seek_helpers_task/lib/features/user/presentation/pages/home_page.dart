import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seek_helpers_task/core/core.dart';
import 'package:seek_helpers_task/features/features.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      searchQuery = searchController.text.toLowerCase().trim();
    });
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      searchQuery = '';
    });
  }

    List<dynamic> _filterUsers(List<dynamic> users) {
    if (searchQuery.isEmpty) {
      return users;
    }

    return users.where((user) {
      final name = (user.name ?? '').toString().toLowerCase();
      final email = (user.email ?? '').toString().toLowerCase();
      final username = (user.username ?? '').toString().toLowerCase();
      final phone = (user.phone ?? '').toString().toLowerCase();

      return name.contains(searchQuery) ||
             email.contains(searchQuery) ||
             username.contains(searchQuery) ||
             phone.contains(searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserHub',
          style: textTheme.headlineMedium!.copyWith(
            color: colorScheme.primaryFixed,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(
              colorScheme.brightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode,
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
            ),
          ),
          SizedBox(width: 18.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: searchController,
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  side: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 12.w),
              ),
              leading: const Icon(Icons.search_outlined),
              trailing: searchQuery.isNotEmpty
                  ? [
                      IconButton(
                        onPressed: _clearSearch,
                        icon: const Icon(Icons.clear),
                        tooltip: 'Clear search',
                      ),
                    ]
                  : null,
              hintText: 'Search...!',
              hintStyle: WidgetStatePropertyAll(textTheme.titleSmall),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase().trim();
                });
              },
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text("Users", style: textTheme.titleLarge),
                if (searchQuery.isNotEmpty) ...[
                  SizedBox(width: 8.w),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        final filteredUsers = _filterUsers(state.users);
                        return Text(
                          '(${filteredUsers.length} found)',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ],
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    context.read<UserBloc>().add(LoadUsers());
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    final filteredUsers = _filterUsers(state.users);
                    // no users found
                    if (filteredUsers.isEmpty && searchQuery.isNotEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64.sp,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No users found',
                              style: textTheme.titleMedium!.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextButton(
                              onPressed: _clearSearch,
                              child: const Text('Clear search'),
                            ),
                          ],
                        ),
                      );
                    }
                    // searched users
                    return ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        return UserCard(user: filteredUsers[index]);
                      },
                    );
                  } else if (state is UserError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64.sp,
                            color: colorScheme.error,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Error: ${state.message}',
                            style: textTheme.titleMedium!.copyWith(
                              color: colorScheme.error,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () => context.read<UserBloc>().add(LoadUsers()),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
      // add new user button
      floatingActionButton: Container(
        width: 90.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        margin: EdgeInsets.only(right: 4.w),
        child: FloatingActionButton(
          onPressed: () {
            context.push('/createUser');
          },
          backgroundColor: colorScheme.primaryFixed,
          child: Text(
            "New User",
            style: textTheme.labelMedium!.copyWith(color: colorScheme.primaryFixedDim),
          ),
        ),
      ),
    );
  }
}
