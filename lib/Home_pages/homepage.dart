import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/main1.dart';
import 'package:pharmacy_app/Home_pages/main2.dart';
import 'package:pharmacy_app/Home_pages/main3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 740,
            child: PageView(
              controller: _controller,
              children: [WelcomePage(), WelcomePage2(), WelcomePage3()],
            ),
          ),
          //creating page indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color.fromARGB(255, 22, 219, 101),
                dotColor: Colors.greenAccent,
                dotHeight: 20,
                dotWidth: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pharmacy_app/Home_pages/main1.dart';
// import 'package:pharmacy_app/Home_pages/main2.dart';
// import 'package:pharmacy_app/Home_pages/main3.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomePage extends StatelessWidget {
//   final _controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final pageHeight = screenHeight * 0.8; // Adjust the height factor as needed
//     final dotHeight = screenHeight * 0.025;
//     final dotWidth = screenWidth * 0.05;

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SizedBox(
//             height: pageHeight,
//             child: PageView(
//               controller: _controller,
//               children: [WelcomePage(), WelcomePage2(), WelcomePage3()],
//             ),
//           ),
//           // Creating page indicator
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20),
//             child: SmoothPageIndicator(
//               controller: _controller,
//               count: 3,
//               effect: ExpandingDotsEffect(
//                 activeDotColor: Color.fromARGB(255, 22, 219, 101),
//                 dotColor: Colors.greenAccent,
//                 dotHeight: dotHeight,
//                 dotWidth: dotWidth,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
