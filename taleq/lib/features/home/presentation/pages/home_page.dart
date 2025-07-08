import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/home/presentation/bloc/home_bloc.dart';
import 'package:taleq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:taleq/features/profile/presentation/widgets/edit_image_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => GetIt.I<ProfileBloc>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: EditImageProfile(
            radius: 20,
            onTap: () => context.go('/profile'),
          ),
          actions: [
            CustomIconButton(
              icon: Icons.notifications_active_outlined,
              onPressed: () {
                context.go('/reminder');
              },
            ),
            CustomIconButton(icon: Icons.search),
          ],
        ),
        body: Center(child: Text('Welcome to home page!')),
      ),
    );
  }
}
