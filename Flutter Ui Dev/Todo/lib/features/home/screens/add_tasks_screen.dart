import 'package:flutter/material.dart';

import '../../../core/utils/theme.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => AddTasksScreenState();
}

class AddTasksScreenState extends State<AddTasksScreen> {
  late FocusNode _textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode = FocusNode();
    Future.delayed(const Duration(milliseconds: 400), () {
      FocusScope.of(context).requestFocus(_textFieldFocusNode);
    });
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scaffold(
          backgroundColor: ThemeClass.cardColor,
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                size: 28,
                Icons.close,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'New Task',
              style: TextStyle(
                  fontSize: 18,
                  color: ThemeClass.largeTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "What task are you planning to perform?",
                style: TextStyle(
                  color: ThemeClass.largeTextColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  focusNode: _textFieldFocusNode,
                  autofocus: true,
                  style: const TextStyle(fontSize: 28, color: Colors.black87),
                  cursorColor: Colors.blue,
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(5),
                    enabled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.business_center_outlined,
                    color: Colors.black26,
                    size: 20,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Design Work",
                    style: TextStyle(
                      color: ThemeClass.largeTextColor,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.black26,
                    size: 20,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Today",
                    style: TextStyle(
                      color: ThemeClass.largeTextColor,
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ]),
          ),
          floatingActionButton: Hero(
            tag: "add",
            child: Container(
              margin: const EdgeInsets.only(left: 30),
              width: double.infinity,
              child: FloatingActionButton(
                isExtended: true,
                heroTag: null,
                autofocus: true,
                elevation: 0,
                shape: const StadiumBorder(
                    side: BorderSide(color: Colors.transparent)),
                onPressed: () {},
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
                      shape: BoxShape.rectangle),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ),
      ),
    );
  }
}
