import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';
import 'package:taleq/features/specialists/presentation/pages/specialist_profile_page.dart';
import 'package:taleq/features/specialists/presentation/widgets/rating_widget.dart';
import 'package:taleq/features/specialists/presentation/widgets/specialists_body.dart';

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
              actions: const [Icon(Icons.search, size: 30)],
            ),
            body: state is SpecialistsSuccesses
                ? ListView.builder(
                    itemCount: state.specialists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final list = state.specialists[index];
                      return InkWell(
                        onTap: () {
                          context.customPush(
                            SpecialistProfilePage(
                              image: list.image,
                              name: list.name,
                              subtitle: list.subtitle,
                              rating: list.rating,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 2,
                          ),
                          child: SizedBox(
                            height: 114,
                            width: 361,
                            child: Card(
                              color: AppPalette.whiteLight,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SpecialistsBody(
                                      image: list.image,
                                      name: list.name,
                                      subtitle: list.subtitle,
                                    ),

                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: RatingWidget(rating: list.rating),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
