import 'package:acme/src/shared/components/glassmorphed/glassmorphed_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int listCount = 10;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlassmorphedAppBar(offset: 16, opacity: 0.4),
      body: ListView.builder(
        itemBuilder: (context, index) {
          EdgeInsets cardEdgeInsets = const EdgeInsets.fromLTRB(16, 8, 16, 0);

          if (index == listCount - 1) {
            cardEdgeInsets = cardEdgeInsets.copyWith(bottom: 8);
          }
          return Container(
            margin: cardEdgeInsets,
            height: 120,
            color: Colors.red,
          );
        },
        itemCount: listCount,
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.grey,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}


// GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           late final EdgeInsets edgeInsets;

//           if (index % 2 == 0) {
//             edgeInsets = const EdgeInsets.fromLTRB(20, 8, 8, 4);
//           } else {
//             edgeInsets = const EdgeInsets.fromLTRB(8, 8, 20, 4);
//           }

//           return Container(
//             margin: edgeInsets,
//             // width: 50,
//             height: 200,
//             color: Colors.red,
//           );
//         },
//       )