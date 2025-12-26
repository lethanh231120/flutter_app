import 'package:flutter/material.dart';

Future<void> navigateToPage(BuildContext context, Widget page) {
  return Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return FadeTransition(opacity: curved, child: child);
      },
    ),
  );
}

void showBottomUpDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (dialogContext, anim1, anim2) {
      return Align(alignment: Alignment.bottomCenter, child: child);
    },
    transitionBuilder: (context, anim1, anim2, widget) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
        child: widget,
      );
    },
  );
}
