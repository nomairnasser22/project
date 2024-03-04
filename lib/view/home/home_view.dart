import 'package:flutter/material.dart';
import 'package:tracker/common/color_extensions.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bills.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/custom_arc.dart';
import '../../view/subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscripe = true;
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "5.66"},
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "12.6"
    },
    {
      "name": "Microsoft Ondrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "9.5"
    },
    {"name": "Netflix", "icon": "assets/img/netflix_logo.png", "price": "20.8"},
  ];
  List bilArr = [
    {"name": "Spotify", "date": DateTime(2024, 2, 21), "price": "5.66"},
    {"name": "Youtube Premium", "date": DateTime(2024, 2, 21), "price": "12.6"},
    {
      "name": "Microsoft Ondrive",
      "date": DateTime(2024, 2, 21),
      "price": "9.5"
    },
    {"name": "Netflix", "date": DateTime(2024, 2, 21), "price": "20.8"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/img/home_bg.png"),
                  Container(
                    padding: EdgeInsets.only(bottom: media.width * 0.1),
                    width: media.width * 0.7,
                    height: media.height * 0.7,
                    child: CustomPaint(
                      painter: CustomArcPainter(end: 220),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/img/app_logo.png",
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Text(
                        "\$1.235",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Text(
                        "This Month Bills",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: TColor.gray60.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: TColor.border.withOpacity(0.15))),
                          child: Text(
                            "See  Your Budget",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                  title: "Activity Subs",
                                  onpressed: () {},
                                  value: "12",
                                  statusColor: TColor.secondary),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                  title: "Highest Subs",
                                  onpressed: () {},
                                  value: "\$20.2",
                                  statusColor: TColor.primary10),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                  title: "Lowest Subs",
                                  onpressed: () {},
                                  value: "\$4.5",
                                  statusColor: TColor.secondaryG),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
                Expanded(
                  child: SegmentButton(
                      title: "Your Supscription",
                      onpressed: () {
                        setState(() {
                          isSubscripe = !isSubscripe;
                        });
                      },
                      isActive: isSubscripe),
                ),
                Expanded(
                  child: SegmentButton(
                      title: "Upcoming Bills",
                      onpressed: () {
                        setState(() {
                          isSubscripe = !isSubscripe;
                        });
                      },
                      isActive: !isSubscripe),
                ),
              ]),
            ),
            if (isSubscripe)
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};
                    return SubscriptionHomeRow(
                      sObj: sObj,
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     SubscriptionInfoView(sObj :sObj)));
                      },
                    );
                  }),
            if (!isSubscripe)
              ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};
                    return UpcomingBills(
                      sObj: sObj,
                      onpressed: () {},
                    );
                  }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
