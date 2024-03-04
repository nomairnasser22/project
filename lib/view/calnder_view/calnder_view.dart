import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:tracker/common/color_extensions.dart';
import '../../common_widget/subscription_cell.dart';
// import '../../common_widget/segment_button.dart';
// import '../../common_widget/subscription_home_row.dart';
// import '../../common_widget/upcoming_bills.dart';
// import '../../common_widget/status_button.dart';
// import '../../common_widget/custom_arc.dart';

class CalnderView extends StatefulWidget {
  const CalnderView({super.key});

  @override
  State<CalnderView> createState() => _CalnderViewState();
}

class _CalnderViewState extends State<CalnderView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime selectedDateNotAppBBar;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    selectedDateNotAppBBar = DateTime.now();
  }

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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Calender",
                                    style: TextStyle(
                                      color: TColor.gray30,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Subs\nSchedule",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3 subscroption for today",
                              style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                calendarAgendaControllerNotAppBar
                                    .openCalendaer();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: TColor.gray60.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color:
                                            TColor.border.withOpacity(0.15))),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "January",
                                      style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      color: TColor.white,
                                      size: 14,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      CalendarAgenda(
                        controller: calendarAgendaControllerNotAppBar,
                        backgroundColor: Colors.transparent,
                        fullCalenderBackgroundColor: TColor.gray80,
                        appbar: true,
                        selectedDayPosition: SelectedDayPosition.right,
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        weekDay: WeekDay.short,
                        fullCalendarScroll: FullCalendarScroll.horizontal,
                        fullCalendarDay: WeekDay.long,
                        selectedDateColor: TColor.white,
                        dateColor: Colors.white,
                        locale: 'en',
                        
                        initialDate: DateTime.now(),
                        calendarEventColor: Colors.green,
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 140)),
                        lastDate: DateTime.now().add(const Duration(days: 140)),
                        events: List.generate(
                            100,
                            (index) => DateTime.now().subtract(
                                Duration(days: index * random.nextInt(5)))),
                        onDateSelected: (date) {
                          setState(() {
                            selectedDateNotAppBBar = date;
                          });
                        },
                        decoration: BoxDecoration(
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: TColor.border.withOpacity(0.15))),
                        selectDecoration: BoxDecoration(
                            color: TColor.gray60,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: TColor.border.withOpacity(0.15))),
                        eventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: TColor.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        selectedEventLogo: Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: TColor.secondaryG,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Junuary",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$24.5",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "29.2.2024",
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Incoming Bills",
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: subArr.length,
              itemBuilder: ((context, index) {
                var obj = subArr[index] as Map? ?? {};
                return SubscriptionCell(
                  sObj: obj,
                  onpressed: () {},
                );
              }),
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
