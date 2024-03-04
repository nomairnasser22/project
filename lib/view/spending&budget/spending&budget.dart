import 'package:flutter/material.dart';
import 'package:tracker/common/color_extensions.dart';
import '../../common_widget/budget_row.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../common_widget/custom_arc_180.dart';

class SpendingAndBudget extends StatefulWidget {
  const SpendingAndBudget({super.key});

  @override
  State<SpendingAndBudget> createState() => _SpendingAndBudgetState();
}

class _SpendingAndBudgetState extends State<SpendingAndBudget> {
  List budArr = [
    {
      "name": "Auto & Tramsport",
      "icon": "assets/img/auto_&_transport.png",
      "spentAmount": "150",
      "total_budget": "400",
      "left_amount": "250",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/entertainment.png",
      "spentAmount": "500",
      "total_budget": "1000",
      "left_amount": "500",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/img/security.png",
      "spentAmount": "800",
      "total_budget": "2000",
      "left_amount": "1200",
      "color": TColor.primary0
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: media.width * 0.5,
                  height: media.width * 0.25,
                  child: CustomPaint(
                    painter: CustomArcPainter180(
                      end: 50,
                      width: 12,
                      bgWidth: 8,
                      arcs: [
                        ArcModel(color: TColor.secondaryG, value: 30),
                        ArcModel(color: TColor.secondary, value: 50),
                        ArcModel(color: TColor.primary10, value: 70),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$ 1.450 ",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "of \$ 3.400",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border:
                          Border.all(color: TColor.border.withOpacity(0.15))),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Budget Is On Track ",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: budArr.length,
                itemBuilder: (context, index) {
                  var bObj = budArr[index] as Map? ?? {};
                  return BudgetRow(
                    bObj: bObj,
                    onpressed: () {},
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  color: TColor.border.withOpacity(0.3),
                  strokeWidth: 1,
                  radius: const Radius.circular(15),
                  borderType: BorderType.RRect,
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add New Category",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          "assets/img/add.png",
                          width: 15,
                          height: 15,
                          color: TColor.gray30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
