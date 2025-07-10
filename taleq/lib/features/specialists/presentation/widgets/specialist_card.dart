import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/extension/git_size_screen.dart';
import 'package:taleq/core/extension/navigation.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/core/widget/custom_text_field2.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';
import 'package:taleq/features/specialists/presentation/pages/specialist_profile_page.dart';
import 'package:taleq/features/specialists/presentation/widgets/rating_widget.dart';
import 'package:taleq/features/specialists/presentation/widgets/specialists_body.dart';

class SpecialistCard extends StatelessWidget {
  const SpecialistCard({super.key, this.scrollDirection,this.color});
  final Axis? scrollDirection;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SpecialistsBloc>().state;
    final bloc = context.read<SpecialistsBloc>();
    if (state is SpecialistsSuccesses) {
      return Column(
        children: [
          state.showSearch
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.getWidth() * 0.065,
                  ),
                  child: CustomTextField2(
                    lefticon: Icon(Icons.search, size: 30),
                    controller: bloc.searchController,
                    onchange: (p0) => bloc.add(SearchEvent(search: p0)),
                    text: AppText.search,
                  ),
                )
              : SizedBox.shrink(),

          Expanded(
            child: ListView.builder(
              scrollDirection: scrollDirection ?? Axis.vertical,
              // physics: AlwaysScrollableScrollPhysics(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }
}
