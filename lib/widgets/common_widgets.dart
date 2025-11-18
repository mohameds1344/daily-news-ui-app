import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';




class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Oops! Something went wrong. Please try again later',
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





// class showEmptyBox extends StatelessWidget {
//   const showEmptyBox({super.key});

//   void showEmptyDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Row(
//             children: [
//               Text("🛠️ ", style: TextStyle(fontSize: 15)),
//               Text(
//                 "This feature is coming soon! ",
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Text("🚀", style: TextStyle(fontSize: 15)),
//             ],
//           ),
//           content: Text("by mohamed,"),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("colsed"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           showEmptyDialog(context);
//         },
//         child: const Text(''),
//       ),
//     );
//   }
// }
