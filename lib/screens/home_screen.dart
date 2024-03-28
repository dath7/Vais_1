import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_app/utils/constants/string_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 11),
                child: Text(
                  "Quản lý học sinh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Expanded(
                child: Divider(
                  indent: 70,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: List.generate(
                  HomeCardTitle.title.length,
                  (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.09,
                              width: size.width * 0.2,
                              child: Card(
                                elevation: 5,
                                shadowColor: Colors.pink.shade300,
                                child: Image.asset(
                                  HomeCardTitle.homeCardTitle[index],
                                  fit: BoxFit
                                      .fill, // fill the card (expand image)
                                ),
                              ),
                            ),
                            Text(HomeCardTitle.title[index]),
                          ])),
            ),
          )
        ],
      ),
    );
  }
}
