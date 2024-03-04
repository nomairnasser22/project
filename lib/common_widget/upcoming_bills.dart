import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class UpcomingBills extends StatelessWidget {
  final Map sObj;
  final VoidCallback onpressed;
  const UpcomingBills({
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
              Container(
                height: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColor.gray70.withOpacity(0.5),
                ),
                alignment: Alignment.center,
                child: Column(children: [
                  Text(
                    "jun",
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "25",
                    style: TextStyle(
                        color: TColor.gray30,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),

              // const SizedBox(width: 8),
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
