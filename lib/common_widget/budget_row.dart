import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class BudgetRow extends StatelessWidget {
  final Map bObj;
  final VoidCallback onpressed;
  const BudgetRow({
    super.key,
    required this.bObj,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    var proVal = (double.tryParse(bObj["spentAmount"]) ?? 0) /
        (double.tryParse(bObj["total_budget"]) ?? 0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onpressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: TColor.border.withOpacity(0.15))),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      bObj["icon"],
                      width: 35,
                      height: 35,
                      color: TColor.gray50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bObj["name"],
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$${bObj["left_amount"]} left to spend",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " \$${bObj["spentAmount"]}",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "of \$${bObj["total_budget"]} left to spend",
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              LinearProgressIndicator(
                backgroundColor: TColor.gray60,
                valueColor: AlwaysStoppedAnimation(
                  bObj["color"],
                ),
                minHeight: 3,
                value: proVal,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
