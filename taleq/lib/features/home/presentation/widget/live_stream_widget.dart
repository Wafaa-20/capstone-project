import 'package:flutter/material.dart';
import 'package:taleq/core/theme/app_palette.dart';

class LiveStreamWidget extends StatelessWidget {
  const LiveStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 100),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppPalette.bluePrimary, width: 3),
              ),
              child: Container(
                padding: EdgeInsets.all(2),
                height: 64,
                width: 64,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset("assets/image/doctor1.png"),
              ),

              // backgroundImage: NetworkImage("")
            ),
          );
        },
      ),
    );
  }
}
