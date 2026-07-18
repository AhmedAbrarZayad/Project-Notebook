import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants/strings/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends ConsumerWidget {
  const AppTitle({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 4.2,
              color: const Color(0xFFB46B60),
            )
          ),
          Text(
            subtitle != null ? subtitle! : NEW_CANVAS_TITLE,
            style: GoogleFonts.caveat(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2F3E4E),
            ),
          )
        ],
      ),
    );
  }
}