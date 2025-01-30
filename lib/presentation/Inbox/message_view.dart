// import 'package:flutter/material.dart';

// class MessageView extends StatelessWidget {
//   const MessageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 50),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: double.i,
//             child: Image.asset('assets/images/voice tracker.gif')),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 25),
//             child: Center(
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'LinkedIn Community',
//                         style: TextStyle(
//                           color: Colors.grey.shade50,
//                           fontSize: 22,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const Icon(
//                         Icons.star_border_outlined,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Semantics(
//                         label: 'User profile section',
//                         child: Row(
//                           children: [
//                             const CircleAvatar(
//                               radius: 20,
//                               backgroundImage: NetworkImage(
//                                 'https://images.unsplash.com/photo-1531123414780-f74242c2b052?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGElMjBibGFjayUyMGdpcmwlMjBwcm9maWxlfGVufDB8fDB8fHww',
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Stan Poty',
//                                   style: TextStyle(
//                                     color: Colors.grey.shade50,
//                                     fontSize: 15,
//                                     fontFamily: 'Poppins',
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '21 Aug, 9:12 AM',
//                                   style: TextStyle(
//                                     color: Colors.grey.shade600,
//                                     fontSize: 12,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         '􀍠',
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                           fontSize: 20,
//                           fontFamily: 'SF Pro',
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Text.rich(
//                     const TextSpan(
//                       text: 'Hi Antoine,\n',
//                       children: [
//                         TextSpan(text: 'I hope you are well.\n'),
//                         TextSpan(
//                           text: 'I made a few changes on the navigation bar I let you know when I\'m done',
//                         ),
//                       ],
//                     ),
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                       fontSize: 14,
//                       height: 1.3,
//                       fontFamily: 'Poppins',
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
