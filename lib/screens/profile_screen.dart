import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_bloc.dart';
import 'package:school_app/authentication/bloc/authentication_event.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              backgroundImage:
                  NetworkImage("https://picsum.photos/250?image=646"),
              // child: ClipOval(
              //   child: Image.asset(
              //     HomeCardTitle.avatar,
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            Positioned(
              left: size.width * 0.17,
              top: size.height * 0.08,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 10,
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Colors.red,
                    size: 15,
                  )),
            ),
          ]),
          const Text(
            "User 1",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.child_care,
                    color: Colors.teal,
                  ),
                  title: const Text("Thông tin học sinh"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.school,
                    color: Colors.teal,
                  ),
                  title: const Text("Thông tin lớp học sinh"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.people_sharp,
                    color: Colors.teal,
                  ),
                  title: const Text("Thông tin phụ huynh"),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ],
          ),
          Card(
            child: ListTile(
              textColor: Colors.red,
              onTap: null,
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text("Đăng xuất"),
              trailing: IconButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          elevation: 5,
                          content: SizedBox(
                            height: size.height * 0.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Bạn muốn đăng xuất ?"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () => {
                                              Navigator.pop(ctx),
                                              context
                                                  .read<AuthenticationBloc>()
                                                  .add(LogoutRequest()),
                                            },
                                        child: const Text("Đăng xuất")),
                                    TextButton(
                                        onPressed: () => Navigator.pop(ctx),
                                        child: const Text("Hủy"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  icon: const Icon(Icons.arrow_forward_ios)),
            ),
          )
        ],
      ),
    );
  }
}
