// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:json_sample/models/user.dart';
// import 'package:json_sample/services/remote_service_users.dart';

// class UserHomePage extends StatefulWidget {
//   const UserHomePage({super.key});

//   @override
//   State<UserHomePage> createState() => _UserHomePageState();
// }

// class _UserHomePageState extends State<UserHomePage> {
//   List<Users>? users;
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     //fetch data from API
//     getData();
//   }

//   getData() async {
//     users = await RemoteServiceUsers().getUsers();
//     if (users != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User'),
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         // ignore: sort_child_properties_last
//         child: ListView.builder(
//           itemCount: users?.length,
//           itemBuilder: (context, index) {
//             return Container(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           users![index].name,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           users![index].username,
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         replacement: Container(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
