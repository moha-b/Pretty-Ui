import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utils/color.dart';
import '../../../../core/utils/theme.dart';

cardWidget(BuildContext context, int currentpagenumber) => Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeClass.cardColor,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "herotags$currentpagenumber",
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: progressColors[
                              currentpagenumber % progressColors.length],
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.black26,
                    ),
                  ],
                ),
                const Spacer(),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  offset: const Offset(0, 0),
                  onEnd: () {
                    const Offset(0, -1);
                  },
                  child: Column(
                    children: [
                      Hero(
                        flightShuttleBuilder: (flightContext,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext) =>
                            Material(
                          color: Colors.transparent,
                          child: toHeroContext.widget,
                        ),
                        tag: "tasks$currentpagenumber",
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "9 Tasks",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        flightShuttleBuilder: (flightContext,
                                animation,
                                flightDirection,
                                fromHeroContext,
                                toHeroContext) =>
                            Material(
                          color: Colors.transparent,
                          child: toHeroContext.widget,
                        ),
                        tag: "title$currentpagenumber",
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Personal",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: ThemeClass.largeTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Hero(
                        tag: "progress$currentpagenumber",
                        child: LinearPercentIndicator(
                          lineHeight: 3,
                          percent: 0.7,
                          curve: Curves.easeIn,
                          barRadius: const Radius.circular(8),
                          fillColor: Colors.transparent,
                          progressColor: progressColors[
                              currentpagenumber % progressColors.length],
                          trailing: Text(
                            "70%",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
