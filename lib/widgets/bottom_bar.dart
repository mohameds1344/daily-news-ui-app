import 'package:flutter/material.dart';

class customBottomWidget extends StatelessWidget {
  const customBottomWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  Widget buildItem(String path, int index) {
    bool isSelected = selectedIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          onItemTapped(index);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(
            path,
            width: 45,
            height: 22,
            color: isSelected ? Colors.blueAccent : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 12, right: 12),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xff262837),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildItem("assets/icons/home.png", 0),
            buildItem("assets/icons/fire.png", 1),
            buildItem("assets/icons/category.png", 2),
            buildItem("assets/icons/user.png", 3),
          ],
        ),
      ),
    );
  }
}
