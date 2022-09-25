// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:json_sample/models/user.dart';
import 'package:json_sample/services/remote_service_users.dart';
import 'package:json_sample/views/user_detail.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  List<Users>? users;//空のList・usersを作成。
  var isLoaded = false;//この時点ではデータバインドしないでね。(データを取り込まないでね・取り込むことをフェッチという)

  //データバインド：JSONファイルなどのデータソースからのデータのフェッチ、またはデータソースへのデータの書き込みを行うように、フォームまたは Webページ上のコントロールを構成するためのプロセスまたはメソッド。

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }//ウィジェットが作成された時点でgetDataの処理を行うようにしてね。

  Future getData() async {
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
        title: Text('User'),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],//ここにイメージを表示する記述をすれば画像が表示される
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users![index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            users![index].username,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserDetailPage(),
                    ),
                  );
                },
              ),
            );
          },
        ),
        replacement: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
