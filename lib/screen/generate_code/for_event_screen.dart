import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../../widgets/uihelper/color.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../generate_screen.dart';

class ForEventScreen extends StatelessWidget {
  const ForEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController startDateTimeController = TextEditingController();
    TextEditingController endDateTimeController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController descController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeData.aboveAppBar),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  CustomCrossContainer(
                    icon: Icons.arrow_back_ios_sharp,
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenerateScreen(),
                          ));
                    },
                    size: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Event",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeData.belowAppBar),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CustomColor.barBgColor.withAlpha(150),
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: CustomColor.goldColor, width: 2)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.barBgColor,
                    blurRadius: 8,
                    blurStyle: BlurStyle.outer,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.event_available,
                    size: 65,
                    color: CustomColor.goldColor,
                  ),
                  CustomTextField(
                    labelText: "Event Name",
                    controller: nameController,
                  ),
                  RowTextField(
                      controller1: startDateTimeController,
                      controller2: endDateTimeController,
                      labelText1: "Start Date and Time",
                      labelText2: "End Date and Time"),
                  CustomTextField(
                    labelText: "Event Location",
                    controller: locationController,
                  ),
                  CustomTextField(
                    labelText: "Description",
                    controller: descController,
                    minLine: 2,
                  ),
                  SizedBox(height: 0),
                  GenerateQrButton(onTap: () {}),
                  SizedBox(height: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
