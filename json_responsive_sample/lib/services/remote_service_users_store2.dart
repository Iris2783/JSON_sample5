// import 'package:json_sample/models/user.dart';
// import 'package:http/http.dart' as http;

// class RemoteServiceUsers {
//   // ignore: body_might_complete_normally_nullable
//   Future<List<Users>?> getUsers() async {
//     var client = http.Client();

//     var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return usersFromJson(json);
//     }
//   }
// }
