import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<IconData> icons = [
    Icons.phone_android_rounded,
    Icons.laptop,
    Icons.watch,
    Icons.checkroom,
    Icons.shopping_bag,
    Icons.sell,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFFCCD0CF)),
            height: 70,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Catagories")
                    ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: icons.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            color: Colors.black, 
                            icon: Icon(icons[index]),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
