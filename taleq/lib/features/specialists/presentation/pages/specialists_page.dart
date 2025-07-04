import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taleq/core/text/app_text.dart';
import 'package:taleq/core/text/text_styles.dart';
import 'package:taleq/core/theme/app_palette.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_bloc.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_event.dart';
import 'package:taleq/features/specialists/presentation/bloc/specialists_state.dart';

class SpecialistsPage extends StatelessWidget {
  const SpecialistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I<SpecialistsBloc>()
            ..add(LoadSpecialists()), // ◀️ أضفنا الحدث هنا
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppText.specialist),
          leading: Image.asset("assets/image/specialist.png"),
          actions: const [Icon(Icons.search, size: 30)],
        ),
        body: BlocBuilder<SpecialistsBloc, SpecialistsState>(
          builder: (context, state) {
            if (state is SpecialistsLoading) {
              // أثناء التحميل
              return const Center(child: CircularProgressIndicator());
            } else if (state is SpecialistsFailure) {
              // لو صار خطأ
              return Center(child: Text(state.message));
            } else if (state is SpecialistsSuccesses) {
              // لما ينجح ويرجع قائمة
              final list = state.specialists;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, index) {
                  final s = list[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Card(
                      color: AppPalette.whiteLight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 11,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(s.image),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  s.name,
                                  style: TextStyles.sf50016.copyWith(
                                    color: AppPalette.black,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  s.subtitle,
                                  style: TextStyles.sf40014.copyWith(
                                    color: AppPalette.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              s.rating.toString(),
                              style: TextStyles.sf40016,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            // الحالة الابتدائية أو غير معروف
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
