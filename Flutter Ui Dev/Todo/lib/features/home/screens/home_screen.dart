import 'package:flutter/material.dart';
import 'package:todo/features/home/screens/widgets/appbar_widget.dart';
import 'package:todo/features/home/screens/widgets/card_align.dart';
import 'package:todo/features/home/screens/widgets/date_display_widget.dart';
import 'package:todo/features/home/screens/widgets/icon_widget.dart';
import 'package:todo/features/home/screens/widgets/name_widget.dart';
import 'package:todo/features/home/screens/widgets/quote_widget.dart';

import '../../../core/services/functions/functions.dart';
import '../../../core/utils/color.dart';
import 'expanded_card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentPage = 0;

  @override
  void dispose() {
    Scrollfunc.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              backgroundGradients[currentPage % backgroundGradients.length],
        ),
        child: SafeArea(
          child: Stack(
            children: [
              appBarWidget(context),
              iconWidget(context),
              nameWidget(context),
              quoteWidget(context),
              dateDisplay(context),
              GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx.abs() > 10 * details.delta.dy.abs()) {
                    // Horizontal swipe
                    if (details.delta.dx < 0) {
                      Scrollfunc.nextPage();
                    } else {
                      Scrollfunc.prevPage();
                    }
                  } else {
                    isContentVisible = true;
                    // Vertical swipe
                    if (details.delta.dy < 1 && details.delta.dy.abs() > 2) {
                      // Swipe upwards
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 800),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final scaleAnimation =
                                Tween(begin: 0.2, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animation, curve: Curves.easeInOut),
                            );

                            final fadeAnimation =
                                Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.fastOutSlowIn),
                            );

                            final offsetY =
                                MediaQuery.of(context).size.height * 0.2;

                            return Transform.translate(
                              offset:
                                  Offset(0, offsetY * (1 - animation.value)),
                              child: ScaleTransition(
                                scale: scaleAnimation,
                                child: FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          pageBuilder: (context, animation1, animation2) =>
                              DetailScreen(
                            currentPage: currentPage,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: PageView(
                  controller: Scrollfunc.pageController,
                  scrollDirection: Axis.horizontal,
                  restorationId: 'home',
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                      debugPrint('Current Page: $currentPage');
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 50.0),
                          CenteredCard(currentpagenumber: 0),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50.0),
                        CenteredCard(currentpagenumber: 1),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 50.0),
                        CenteredCard(currentpagenumber: 2),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
