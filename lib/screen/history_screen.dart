import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/database/local_database/db_helper.dart';
import 'package:qr_plus/provider/db_provider.dart';
import 'package:qr_plus/provider/tab_index_provider.dart';
import 'package:qr_plus/screen/result_screen.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../widgets/custom_cross_container.dart';
import '../widgets/uihelper/color.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: context.watch<TabIndexProvider>().index);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //_tabController.dispose();
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
                context.read<TabIndexProvider>().setTabIndex(false);
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => HomeScreen(),
                //     ));
                Navigator.pop(context);
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
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(6),
                ),
                dividerColor: CustomColor.barBgColor,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                indicatorSize: TabBarIndicatorSize.tab,
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
                  _customTabView(isCreate: false),
                  _customTabView(isCreate: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customTabView({required bool isCreate}) {
    final dbDataProvider = context.watch<DBProvider>();
    return (isCreate
            ? dbDataProvider.allCreateData.isEmpty
            : dbDataProvider.allScanData.isEmpty)
        ? Center(
            child: Text(
              "Nothing to show !!!\n${isCreate ? "Create any QrCode" : "Scan any QrCode"}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.1,
                  ),
            ),
          )
        : ListView.builder(
            itemCount: isCreate
                ? dbDataProvider.allCreateData.length
                : dbDataProvider.allScanData.length,
            itemBuilder: (BuildContext context, int revIdx) {
              final itemCount = isCreate
                  ? dbDataProvider.allCreateData.length
                  : dbDataProvider.allScanData.length;
              final index = itemCount - 1 - revIdx;
              return Padding(
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
                    onTap: () {
                      context.read<TabIndexProvider>().setTabIndex(isCreate);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              code: isCreate
                                  ? dbDataProvider.allCreateData[index]
                                      [DBHelper.createTableColumnCode]
                                  : dbDataProvider.allScanData[index]
                                      [DBHelper.scanTableColumnCode],
                              date: isCreate
                                  ? dbDataProvider.allCreateData[index]
                                      [DBHelper.createTableColumnDate]
                                  : dbDataProvider.allScanData[index]
                                      [DBHelper.scanTableColumnDate],
                            ),
                          ));
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              isCreate
                                  ? dbDataProvider.allCreateData[index]
                                      [DBHelper.createTableColumnCode]
                                  : dbDataProvider.allScanData[index]
                                      [DBHelper.scanTableColumnCode],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                dbDataProvider.deleteData(
                                    sno: isCreate
                                        ? dbDataProvider.allCreateData[index]
                                            [DBHelper.createTableColumnSno]
                                        : dbDataProvider.allScanData[index]
                                            [DBHelper.scanTableColumnSno],
                                    isCreate: isCreate);
                              },
                              child: Icon(Icons.delete_forever, size: 25)),
                        ],
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Data"),
                        Text(isCreate
                            ? dbDataProvider.allCreateData[index]
                                [DBHelper.createTableColumnDate]
                            : dbDataProvider.allScanData[index]
                                [DBHelper.scanTableColumnDate]),
                      ],
                    ),
                    leading: Image.asset(
                      "assets/result/resultIcon.png",
                      height: 38,
                      width: 38,
                    ),
                    titleTextStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0,
                            ),
                    subtitleTextStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
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
              );
            },
          );
  }
}
