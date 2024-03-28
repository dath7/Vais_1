import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_app/screens/chat_detail_screen.dart';
import 'package:school_app/screens/check_in_screen.dart';
import 'package:school_app/screens/home_screen.dart';

import 'package:school_app/screens/profile_screen.dart';
import 'package:school_app/screens/time_table_screen.dart';
import 'package:school_app/screens/chat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final _colorScheme = Theme.of(context).colorScheme;
  int _currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const TimetableScreen(),
    const CheckInScreen(),
    const ChatScreen(),
    const ProfileScreen()
  ];
  List<String> infoBottomBar = [
    "Trang chủ",
    "Lịch",
    "Điểm danh",
    "Tin nhắn",
    "Hồ sơ"
  ];
  List<String> info = [
    "Trang chủ",
    "Lịch học",
    "Điểm danh",
    "Tin nhắn",
    "Hồ sơ học sinh"
  ];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.calendar_month,
    Icons.checklist_outlined,
    Icons.message,
    Icons.perm_identity
  ];

  List<Widget> actions = [
    IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_active_outlined,
          color: Colors.black,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.teal.shade300,
        centerTitle: true,
        title: Text(
          info[_currentIndex],
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: actions,
      ),

      bottomNavigationBar: BottomAppBar(
        height: size.height * 0.1,
        color: Colors.grey.shade400,
        shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            CircleBorder()),
        notchMargin: 0,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                  if (_currentIndex == icons.length - 1) {
                    actions = [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ))
                    ];
                  } else {
                    actions = [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.black,
                          ))
                    ];
                  }
                });
              },
              child: BottomBarItem(
                index: index,
                icon: Icon(
                  icons[index],
                  color: (_currentIndex == index) ? Colors.teal : Colors.black,
                ),
                title: Text(
                  infoBottomBar[index],
                  style: TextStyle(
                      color:
                          _currentIndex == index ? Colors.teal : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),

      // // ),

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   backgroundColor: Colors.grey.shade300,
      //   icons: icons,
      //   activeIndex: _currentIndex,
      //   onTap: _onItemTapped,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.verySmoothEdge,
      // ),
      // Container(
      // BottomNavigationBar(
      //   onTap: _onItemTapped,
      //   currentIndex: _currentIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //       activeIcon: Icon(Icons.home_outlined),
      //       icon: Icon(
      //         Icons.home_outlined,
      //         color: Colors.black,
      //       ),
      //       label: "Trang chủ",
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.calendar_month,
      //           color: Colors.black,
      //         ),
      //         label: "Lịch"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.black,
      //         ),
      //         label: "Tra cứu"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.perm_identity_outlined,
      //           color: Colors.black,
      //         ),
      //         label: "Hồ sơ"),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.perm_identity_outlined,
      //           color: Colors.black,
      //         ),
      //         label: "Hồ sơ"),
      //   ],

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     ElevatedButton(
      // onPressed: () => showDialog(
      //   context: context,
      //   builder: (ctx) => AlertDialog(
      //     content: SizedBox(
      //       height: 100,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           const Text("Do you really want to log out?"),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               TextButton(
      //                   onPressed: () => {
      //                         Navigator.pop(ctx),
      //                         context
      //                             .read<AuthenticationBloc>()
      //                             .add(LogoutRequest()),
      //                       },
      //                   child: const Text("Log out")),
      //               TextButton(
      //                   onPressed: () => Navigator.pop(ctx),
      //                   child: const Text("Cancel"))
      //             ],
      //           )
      //         ],
      //       ),
      //           ),
      //         ),
      //       ),
      //       child: const Text("Log out"),
      //     ),
      //   ],
      body: screens[_currentIndex],
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final int index;
  final Icon icon;
  final Text title;
  const BottomBarItem(
      {super.key,
      required,
      required this.icon,
      required this.title,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        icon,
        title,
      ],
    );
  }
}
