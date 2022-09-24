import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/remote_service_users.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
 List<Users>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    users = await RemoteServiceUsers().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
    );
  }
}
