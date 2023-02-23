import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class OrdersStatusTabs extends StatefulWidget {
  List statusList = [];
  DateTime date;
  int statusId;
  String comment;
  String userType;
  OrdersStatusTabs({
    super.key,
    required this.statusList,
    required this.date,
    required this.comment,
    required this.statusId,
    required this.userType,
  });

  @override
  State<OrdersStatusTabs> createState() => _OrdersStatusTabsState();
}

class _OrdersStatusTabsState extends State<OrdersStatusTabs> {
  bool tabheightchanger = false;
  bool logic = false;
  void myLogic() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        logic = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(widget.statusList.toString());
    log(widget.statusId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "${widget.date.day} / ${widget.date.month} / ${widget.date.year}",
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.statusList[widget.statusId - 1],
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download,
                          color: Colors.blueGrey,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  widget.userType,
                  trimLines: 2,
                  preDataText: "User type:",
                  preDataTextStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                  style: GoogleFonts.montserrat(color: Colors.black),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                ),
                const ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimLines: 2,
                  preDataTextStyle: TextStyle(fontWeight: FontWeight.w500),
                  style: TextStyle(color: Colors.black),
                  moreStyle: TextStyle(color: Colors.blue),
                  lessStyle: TextStyle(color: Colors.blue),
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' show less',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
