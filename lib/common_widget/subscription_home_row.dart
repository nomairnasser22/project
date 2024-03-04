import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class SubscriptionHomeRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback onpressed;
  const SubscriptionHomeRow({
    super.key,
    required this.sObj,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          height: 64,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: TColor.border.withOpacity(0.15))),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                sObj["icon"],
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  sObj["name"],
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "\$${sObj["price"]}",
                style: TextStyle(
                    color: TColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
