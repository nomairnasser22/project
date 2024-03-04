import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final Color statusColor;
  final String value;
  const StatusButton({
    super.key,
    required this.title,
    required this.onpressed,
    required this.value,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(
                color: TColor.gray60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: TColor.border.withOpacity(0.15))),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: TColor.gray40,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 1,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}
