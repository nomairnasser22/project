import 'package:flutter/material.dart';
import 'package:tracker/common/color_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/image_button.dart';
import '../../common_widget/rounded_textField.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  TextEditingController txtDescription = TextEditingController();

  List subArr = [
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
    },
    {
      "name": "HBO Go",
      "icon": "assets/img/hbo_logo.png",
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/img/youtube_logo.png",
    },
    {
      "name": "Microsoft Ondrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
    },
  ];
  double amountVal = 0.09;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: TColor.gray70.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              "assets/img/back.png",
                              width: 25,
                              height: 25,
                              color: TColor.gray30,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("New",
                              style: TextStyle(
                                  color: TColor.gray30, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("Add New\nSubscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    width: media.width,
                    height: media.width * 0.6,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.65,
                        enlargeFactor: 0.4,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      itemCount: subArr.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        var sObj = subArr[itemIndex] as Map? ?? {};

                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  sObj["icon"],
                                  width: media.width * 0.4,
                                  height: media.width * 0.4,
                                  fit: BoxFit.fitHeight,
                                ),
                                const Spacer(),
                                Text(
                                  sObj["name"],
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20)
                              ]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: RoundedTextField(
              title: "Description",
              controller: txtDescription,
              titleAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageButton(
                    image: "assets/img/minus.png",
                    onpressed: () {
                      amountVal -= 0.1;
                      if (amountVal < 0) {
                        amountVal = 0;
                      }
                      setState(() {});
                    }),
                Column(
                  children: [
                    Text(
                      "Monthly Price",
                      style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${amountVal.toStringAsFixed(2)}.",
                      style: TextStyle(
                        color: TColor.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                ImageButton(
                    image: "assets/img/plus.png",
                    onpressed: () {
                      amountVal += 0.1;

                      setState(() {});
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child:
                PrimaryButton(title: "Add New Subscription", onPressed: () {}),
          ),
        ]),
      ),
    );
  }
}

