import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Oops! Something went wrong, Please try again later',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeRotatingDots(
      color: Colors.grey,
      size: 30,
    );
  }
}

void showFeatureMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.only(bottom: 5),

      content: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xff4a4e69),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.build, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "This feature is coming soon! 🚀",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
