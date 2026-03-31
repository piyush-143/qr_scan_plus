import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/core/utils/size_config.dart';
import 'package:qr_plus/providers/db_provider.dart';
import 'package:qr_plus/providers/tab_index_provider.dart';
import 'package:qr_plus/screens/result_screen.dart';
import 'package:qr_plus/core/constants/size_data.dart';
import 'package:qr_plus/core/constants/color.dart';
import 'package:qr_plus/core/constants/assets.dart';
import 'package:qr_plus/widgets/custom_cross_container.dart';

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
      initialIndex: context.read<TabIndexProvider>().index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: AppBar(
        toolbarHeight: SizeData.toolBarHeight.h,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'History',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 27.r, color: Colors.white),
        ),
        titleSpacing: 35.w,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: CustomCrossContainer(
              onTap: () {
                context.read<TabIndexProvider>().setTabIndex(false);
                Navigator.pop(context);
              },
              icon: Icons.close,
              size: 32.r,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
        child: Column(
          children: [
            Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
              decoration: BoxDecoration(
                color: CustomColor.barBgColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [CustomColor.goldColor, CustomColor.bgColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                dividerColor: CustomColor.barBgColor,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 17.r,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Scan'),
                  Tab(text: 'Create'),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: TabBarView(
                physics: const ScrollPhysics(),
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
    final data =
        isCreate ? dbDataProvider.allCreateData : dbDataProvider.allScanData;

    if (data.isEmpty) {
      return Center(
        child: Text(
          'Nothing to show !!!\n${isCreate ? 'Create any QrCode' : 'Scan any QrCode'}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 22.r,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                height: 1.1,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, revIdx) {
        final index = data.length - 1 - revIdx;
        final item = data[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.barBgColor,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.barBgColor,
                  blurRadius: 10.r,
                  blurStyle: BlurStyle.solid,
                  offset: Offset(0, 1.h),
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
                      result: item,
                    ),
                  ),
                );
              },
              title: Padding(
                padding: EdgeInsets.only(bottom: 4.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (item.id != null) {
                          dbDataProvider.deleteData(
                            sno: item.id!,
                            isCreated: isCreate,
                          );
                        }
                      },
                      child: const Icon(Icons.delete_forever, size: 25),
                    ),
                  ],
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Data'),
                  Text('${item.date.day}/${item.date.month}/${item.date.year}'),
                ],
              ),
              leading: Image.asset(
                AppAssets.resultIcon,
                height: 38.r,
                width: 38.r,
              ),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15.r,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
              subtitleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 13.r,
                    color: Colors.white60,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0,
                  ),
              iconColor: CustomColor.goldColor,
              minTileHeight: 60.h,
            ),
          ),
        );
      },
    );
  }
}
