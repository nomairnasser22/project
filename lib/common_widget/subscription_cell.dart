import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onpressed;
  const SubscriptionCell({
    super.key,
    required this.sObj,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: TColor.gray60,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: TColor.border.withOpacity(0.15))),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sObj["icon"],
              width: 50,
              height: 50,
            ),
            const Spacer(),
            Text(
              sObj["name"],
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
