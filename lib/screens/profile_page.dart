import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 35,
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.blue,
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.blue,
                  child: Row(
                    children: const [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'User Phone',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.blue,
                  child: Row(
                    children: const [
                      Icon(Icons.mail),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'User Email',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Log out')),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Edit Profile')),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
