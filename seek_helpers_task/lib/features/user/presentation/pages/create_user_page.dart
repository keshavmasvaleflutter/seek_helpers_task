import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:seek_helpers_task/core/core.dart';
import 'package:seek_helpers_task/features/features.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();


  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _createUser() {
    if (_formKey.currentState!.validate()) {
      final newId = DateTime.now().millisecondsSinceEpoch; // unique ID
      final user = User(
        id: newId,
        name: _nameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        website: '',
        address: Address(
          street: '',
          suite: '',
          city: '',
          zipcode: '',
          geo: Geo(
            lat: '0',
            lng: '0',
          ),
        ),
        company: Company(
          name: '',
          catchPhrase: '',
          bs: '',
        ),
      );

      context.read<UserBloc>().add(AddUser(user));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New User',
          style: textTheme.headlineMedium!.copyWith(
            color: colorScheme.primaryFixed,
          ),
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAdding) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is UserAdded) {
            setState(() {
              _isLoading = false;
            });
            context.pop();
          } else if (state is UserAddError) {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),
                backgroundColor: colorScheme.error,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Personal Information Section
                _buildSectionTitle('Personal Information', textTheme),
                SizedBox(height: 12.h),
                _buildTextFormField(
                  controller: _nameController,
                  hintText: 'Enter your name',
                  label: 'Full Name',
                  validator:
                      (value) =>
                          value?.isEmpty == true ? 'Name is required' : null,
                ),
                SizedBox(height: 16.h),
                _buildTextFormField(
                  controller: _usernameController,
                  label: 'Username',
                  hintText: 'Enter your username',
                  validator:
                      (value) =>
                          value?.isEmpty == true
                              ? 'Username is required'
                              : null,
                ),
                SizedBox(height: 16.h),
                _buildTextFormField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  validator: (p0) => p0!.isEmpty ? 'Email is required' : null,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                _buildTextFormField(
                  controller: _phoneController,
                  label: 'Phone',
                  hintText: 'Enter your phone number',
                  validator: (p0) => p0!.isEmpty ? 'Phone number is required' : null,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.h),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _createUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primaryFixed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child:
                        _isLoading
                            ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  colorScheme.primary,
                                ),
                              ),
                            )
                            : Text(
                              'Add User',
                              style: textTheme.titleMedium!.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Text(
      title,
      style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      labelText: label,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
