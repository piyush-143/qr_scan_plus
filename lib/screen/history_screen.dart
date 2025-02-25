import 'package:flutter/material.dart';
import 'package:qr_plus/screen/home_screen.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../widgets/uihelper/color.dart';
import '../widgets/custom_cross_container.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: AppBar(
        toolbarHeight: SizeData.toolBarHeight,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          "History",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 27, color: Colors.white),
        ),
        titleSpacing: 35,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: CustomCrossContainer(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              icon: Icons.close,
              size: 32,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        child: Column(
          children: [
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              decoration: BoxDecoration(
                color: CustomColor.barBgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [CustomColor.goldColor, CustomColor.bgColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter), // Active tab color
                  borderRadius: BorderRadius.circular(6),
                ),
                dividerColor: CustomColor.barBgColor,
                labelColor: Colors.white, // Active text color
                unselectedLabelColor: Colors.white, // Inactive text color
                labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600), // Bold text
                indicatorSize: TabBarIndicatorSize
                    .tab, // Make indicator the same size as tab
                tabs: [
                  Tab(text: 'Scan'),
                  Tab(text: 'Create'),
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: TabBarView(
                physics: ScrollPhysics(),
                controller: _tabController,
                clipBehavior: Clip.none,
                children: [
                  _customTabView(),
                  _customTabView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customTabView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColor.barBgColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: CustomColor.barBgColor,
                blurRadius: 10, blurStyle: BlurStyle.solid,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "http://www.youtube.com/watch?v=Zd9g7sKvgIM",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.delete_forever, size: 25),
                ],
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Data"),
                Text("Date"),
              ],
            ),
            leading: Image.asset(
              "assets/result/resultIcon.png",
              height: 38,
              width: 38,
            ),
            titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
            subtitleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 13,
                  color: Colors.white60,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                ),
            //tileColor: CustomColor.goldColor,
            iconColor: CustomColor.goldColor,
            minTileHeight: 60,
          ),
        ),
      ),
    );
  }
}
