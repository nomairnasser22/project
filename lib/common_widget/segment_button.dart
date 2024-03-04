import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final bool isActive;
  const SegmentButton(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: TColor.gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TColor.border.withOpacity(0.15)))
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? TColor.white : TColor.gray30,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
