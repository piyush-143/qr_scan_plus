import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../../provider/db_provider.dart';
import '../../provider/toggle_provider.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../../widgets/uihelper/color.dart';
import '../../widgets/uihelper/concat_string.dart';
import '../generate_screen.dart';
import '../result_screen.dart';

class ForEventScreen extends StatefulWidget {
  const ForEventScreen({super.key});

  @override
  State<ForEventScreen> createState() => _ForEventScreenState();
}

class _ForEventScreenState extends State<ForEventScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController startDateTimeController = TextEditingController();
  TextEditingController endDateTimeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // nameController.dispose();
    // startDateTimeController.dispose();
    // endDateTimeController.dispose();
    // locationController.dispose();
    // descController.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> code = [
      nameController,
      startDateTimeController,
      endDateTimeController,
      locationController,
      descController
    ];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
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
                    GenerateQrButton(
                      onTap: () async {
                        final date = DateTime.now();
                        String d =
                            "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
                        await player.setAsset("assets/audio/beepSound.mp3");
                        context.read<ToggleProvider>().vibBeep(player);
                        context.read<DBProvider>().addData(
                            code: concatenateString(code).text,
                            date: DateTime.now(),
                            isCreate: true);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                code: concatenateString(code).text,
                                navBack: GenerateScreen(),
                                date: d,
                              ),
                            ));
                      },
                    ),
                    SizedBox(height: 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
