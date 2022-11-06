import 'dart:convert';
import 'package:api_project/Views/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RandomApi extends StatefulWidget {
  const RandomApi({Key? key}) : super(key: key);

  @override
  State<RandomApi> createState() => _RandomApiState();
}

class _RandomApiState extends State<RandomApi> {
  String url = 'https://randomuser.me/api/?results=50';
  bool isloading = false;
  late List userData;
  getData() async {
    var response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['results'];

    setState(() {
      userData = data;
      isloading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random API',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // backgroundColor:colo ,
      ),
      body: Builder(builder: (context) {
        if (isloading == true) {
          return ListView.builder(
            itemCount: userData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                          title: userData[index]['name']['title'],
                          first: userData[index]['name']['first'],
                          last: userData[index]['name']['last'],
                          gender: userData[index]['gender'],
                          email: userData[index]['email'],
                          picture: userData[index]['picture']['large']),
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userData[index]['name']['first']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userData[index]['email']),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userData[index]['gender']),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
