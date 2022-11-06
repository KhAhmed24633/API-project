import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
    required this.title,
    required this.first,
    required this.last,
    required this.gender,
    required this.email,
    required this.picture,
  }) : super(key: key);
  String title, first, last, gender, email, picture;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  child: Image.network(widget.picture),
                  radius: 50,
                ),
              ),
            ],
          ),
          const ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
              size: 40,
            ),
            title: Text(
              'Name',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'ABdula lalsjffhnv',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
