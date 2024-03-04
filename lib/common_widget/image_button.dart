import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback onpressed;
  const ImageButton({
    super.key,
    required this.image,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: TColor.border.withOpacity(0.15))),
          alignment: Alignment.center,
          child: Image.asset(
            image,
            width: 50,
            height: 50,
            color: TColor.gray70,
          )),
    );
  }
}
