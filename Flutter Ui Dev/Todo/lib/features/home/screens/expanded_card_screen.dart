import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo/features/home/screens/widgets/strike_through.dart';

import '../../../core/services/data/data_local.dart';
import '../../../core/utils/color.dart';
import '../../../core/utils/theme.dart';
import 'add_tasks_screen.dart';

class DetailScreen extends StatefulWidget {
  final int currentPage;

  const DetailScreen({
    super.key,
    required this.currentPage,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool isContentVisible = false;

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        backgroundColor: const Color(0xfffffefe),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              Visibility(
                visible: isContentVisible,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20.0, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isContentVisible = false;
                          });
                          Navigator.pop(
                            context,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Hero(
                      tag: "herotags${widget.currentPage}",
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
                          color: progressColors[
                              widget.currentPage % progressColors.length],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                      tag: "tasks${widget.currentPage}",
                      child: const Text(
                        "9 Tasks",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                      tag: "title${widget.currentPage}",
                      child: const Text(
                        "Personal",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: ThemeClass.largeTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "progress${widget.currentPage}",
                      child: LinearPercentIndicator(
                        lineHeight: 3,
                        percent: 0.7,
                        curve: Curves.easeIn,
                        barRadius: const Radius.circular(8),
                        fillColor: Colors.transparent,
                        progressColor: progressColors[
                            widget.currentPage % progressColors.length],
                        trailing: Text(
                          "70%",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isContentVisible,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: checkboxList.map((checkbox) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: BorderDirectional(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  side: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 2,
                                  ),
                                  value: checkbox.enabled,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox.enabled = value!;
                                    });
                                  },
                                  title: StrikeThrough(
                                    todoText: checkbox.title,
                                    todoToggle: checkbox.enabled,
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  enabled: true,
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Tomorrow",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: checkboxList2.map((checkbox) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: BorderDirectional(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  side: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 2,
                                  ),
                                  value: checkbox.enabled,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkbox.enabled = value!;
                                    });
                                  },
                                  title: StrikeThrough(
                                    todoText: checkbox.title,
                                    todoToggle: checkbox.enabled,
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  enabled: true,
                                  checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: isContentVisible,
          child: Hero(
            tag: "add",
            child: Container(
              margin: const EdgeInsets.only(bottom: 32.0, right: 10),
              child: FloatingActionButton(
                heroTag: null,
                elevation: 0,
                shape: const StadiumBorder(
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1000),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 800),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const AddTasksScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                backgroundColor: Colors.transparent,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 63, 102, 174),
                        GradientColors.color2top,
                        GradientColors.color2bottom,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
