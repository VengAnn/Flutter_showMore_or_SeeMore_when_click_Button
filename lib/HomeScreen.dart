import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMOreItem = false;
  List<String> itemsText = [
    "save",
    "Market",
    "Reels",
    "Group",
    "Video",
    "shop"
  ];
  List<IconData> itemIconData = [
    Icons.save,
    Icons.store,
    Icons.ondemand_video,
    Icons.group,
    Icons.video_call,
    Icons.shop,
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: showMOreItem ? 300 : 200,
            width: double.maxFinite,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 0.4,
              ),
              scrollDirection: Axis.vertical,
              itemCount: _getItemsCount(),
              itemBuilder: (context, index) {
                return _getContainerWidget(
                    itemsText[index], itemIconData[index]);
              },
            ),
          ),
          //
          _buildElevatedButton(),
        ],
      ),
    );
  }

//
  int _getItemsCount() {
    return showMOreItem ? itemsText.length : 4;
  }

  Widget _buildElevatedButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showMOreItem = !showMOreItem;
                });
              },
              child: Text(showMOreItem ? "See less" : "See More"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _getContainerWidget(String text, IconData iconData) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData),
            Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
