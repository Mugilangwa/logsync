// import 'package:flutter/material.dart';
// import 'package:logisync_mobile/views/customer/negotiation.dart';

// // ignore: must_be_immutable

// // ignore: must_be_immutable
// class Replies extends StatefulWidget {
//   final requestFormKey = GlobalKey<FormState>();
//   Replies({super.key});

//   @override
// // ignore: library_private_types_in_public_api
//   _RepliesState createState() => _RepliesState();
// }

// class _RepliesState extends State<Replies> {
//   bool ischecked = false;
//   bool isvisible = false;
//   bool isagree = false;
 
//   late final String? customerprice;
//   final double campanyprice = 50000;
//   final TextEditingController _priceControler = TextEditingController();

//   void negotiate(){
//     setState(() {
//       isvisible =  !isvisible; 
//     });
//   }












//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Number of Replies')),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: ScrollConfiguration(
//           behavior: NoScrollbarBehavior(),
//           child: SingleChildScrollView(
//               child: Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                   ElevatedButton(
//                        style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius:  BorderRadius.circular(5)
//                         )
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(8),
//                             child: Text('Campany Name'),
//                           ),
//                           Column(
//                             children: [
                              
//                               Text( 'Tsh 50000 '
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  NegotiationPage(activeRequest: null,)),
//                         );
//                       },
//                     )
//                  ],
//                 ),
//               ),
//             ),
//           )
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NoScrollbarBehavior extends ScrollBehavior {
//   @override
//   Widget buildScrollbar(
//       BuildContext context, Widget child, ScrollableDetails details) {
//     return child; // Return the child without a scrollbar
//   }
// }




