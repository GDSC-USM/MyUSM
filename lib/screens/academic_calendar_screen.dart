import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class AcademicCalendar extends StatelessWidget {
  static const String routeName = "/academic_calendar";
  final String file;

  const AcademicCalendar({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Academic Calendar").build(context),
      body: SfPdfViewer.asset(file),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }
}
