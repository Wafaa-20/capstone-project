import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/button/custom_icon_button.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';
import 'package:taleq/features/specialists/presentation/widgets/specialist_card.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SpecialistsBloc>()..add(LoadSpecialists()),
      child: BlocConsumer<SpecialistsBloc, SpecialistsState>(
        listener: (context, state) {
          if (state is SpecialistsLoading) {
          } else if (state is SpecialistsFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          // final bloc = context.read<SpecialistsBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text(AppText.specialist),

              leading: Image.asset("assets/image/specialist.png"),
              actions: [
                CustomIconButton(
                  icon: Icons.search,
                  size: 35,
                  color: AppPalette.black,
                  onPressed: () {},
                ),
              ],
            ),
            body: SafeArea(child: SpecialistCard()),
          );
        },
      ),
    );
  }
}
