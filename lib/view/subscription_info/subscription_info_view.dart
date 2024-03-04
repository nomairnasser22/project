import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../common_widget/item_row.dart';
import '../../common/color_extensions.dart';
import '../../common_widget/secondary_button.dart';

class SubscriptionInfoView extends StatefulWidget {
  final Map sObj;
  const SubscriptionInfoView({super.key, required this.sObj});

  @override
  State<SubscriptionInfoView> createState() => _SubscriptionInfoViewState();
}

class _SubscriptionInfoViewState extends State<SubscriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xff282833),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: media.width * 0.9,
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  "assets/img/dorp_down.png",
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ),
                              ),
                              Text(
                                "Subscription Info",
                                style: TextStyle(
                                    color: TColor.gray30, fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  "assets/img/Trash.png",
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            widget.sObj["icon"],
                            width: media.width * 0.25,
                            height: media.width * 0.25,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.sObj["name"],
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "\$${widget.sObj["price"]}",
                            style: TextStyle(
                                color: TColor.gray20,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      // height: media.width * 1,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: TColor.gray60.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(children: [
                              ItemRow(
                                title: "Name ",
                                value: widget.sObj["name"],
                              ),
                              const ItemRow(
                                  title: "Description:", value: "Music App"),
                              const ItemRow(
                                  title: "Category", value: "Enteryeinment"),
                              const ItemRow(title: "Reminder", value: "Never"),
                              const ItemRow(
                                  title: "Currency", value: "USD (\$)"),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SecondaryButton(title: "Save", onPressed: () {})
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
