import 'package:flutter/material.dart';


class CustomModal extends StatelessWidget {
  const CustomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Align(
        alignment: Alignment.center,
        child: DraggableScrollableSheet(
          initialChildSize: 0.8,
          maxChildSize: 1.0,
          minChildSize: 0.2,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  ListTile(
                    title: const Text('Page Title'),
                    trailing: const Icon(Icons.close),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('The page content'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}





// void showModal(BuildContext content){
//   Navigator.of(content).push(
//       PageRouteBuilder(
//       opaque: false,
//       pageBuilder =(BuildContext content, _, __))=>CustomModal(),
//       transtionBuilder: (content , animation, _,child){
//         //right to left 
//         // const beginOffset = Offset(1.0,0.0);
//         // top to bottom
//         const beginOffset = Offset(0.0, -1.0);


//         const endOffset = Offset.zero;

//         var tween = Tween(begin : beginOffset, end:endOffset)
//         .chain(CurveTween(curve: Curves.easeInOut));

//         return SlideTransition(
//           position: animation.driver(tween),
//           child:child
//           );
          
//       }
//       );
// }



void showCustomModal(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false, // Makes the background transparent
      pageBuilder: (BuildContext context, _, __) => CustomModal(),
      transitionsBuilder: (context, animation, _, child) {
        // Define the animation - change Offset for direction
      //  const beginOffset = Offset(1.0, 0.0); // Right to left
       const beginOffset = Offset(0.0, -1.0); // Top to bottom

        const endOffset = Offset.zero;
        var tween = Tween(begin: beginOffset, end: endOffset)
            .chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
