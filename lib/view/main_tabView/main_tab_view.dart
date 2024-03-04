import 'package:flutter/material.dart';
import '../../view/add_subscription/add_subscription_view.dart';
import '../../common/color_extensions.dart';
import '../calnder_view/calnder_view.dart';
import '../home/home_view.dart';
import '../spending&budget/spending&budget.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(
            bucket: pageStorageBucket,
            child: currentTabView,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.asset("assets/img/bottom_bar_bg.png"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = const HomeView();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomeView()));
                                });
                              },
                              icon: Image.asset(
                                "assets/img/home.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 0
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 1;
                                  currentTabView = const SpendingAndBudget();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/budgets.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 1
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                              height: 50,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 2;
                                  currentTabView = CalnderView();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/calendar.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 2
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 3;
                                  currentTabView = Container();
                                });
                              },
                              icon: Image.asset(
                                "assets/img/creditcards.png",
                                width: 20,
                                height: 20,
                                color: selectTab == 3
                                    ? TColor.white
                                    : TColor.gray30,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddSubscriptionView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: TColor.secondary.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/img/center_btn.png",
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
