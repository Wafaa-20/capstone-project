import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/navigation/data/models/navigation_model.dart';
import 'package:taleq/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<NavigationBloc>();
          return BlocBuilder<NavigationBloc, NavState>(
            builder: (context, state) {
              int currentIndex = 0;
              if (state is NavigationSelectedState) {
                currentIndex = state.selectedIndex;
              }

              return Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    bloc.pages[currentIndex],
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 82,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(items.length, (index) {
                            final item = items[index];
                            final isSelected = currentIndex == index;

                            return GestureDetector(
                              onTap: () {
                                bloc.add(
                                  ChangeNavigationSelectedEvent(index: index),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      8,
                                      0,
                                      0,
                                    ),
                                    child: SvgPicture.asset(
                                      item.svgPath,
                                      width: 35,
                                      height: 35,
                                      colorFilter: ColorFilter.mode(
                                        isSelected
                                            ? AppPalette.bluePrimary
                                            : AppPalette.navGray,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    item.label,
                                    style: TextStyles.sf30014.copyWith(
                                      color: isSelected
                                          ? AppPalette.bluePrimary
                                          : AppPalette.navGray,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  if (isSelected)
                                    SvgPicture.asset(
                                      'assets/image/Polygon 1.svg',
                                      width: 10,
                                      height: 10,
                                    )
                                  else
                                    const SizedBox(height: 10),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
