import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/widgets/oval_bg.dart';

import '../../provider/db_provider.dart';
import '../../provider/toggle_provider.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../../widgets/uihelper/color.dart';
import '../../widgets/uihelper/concat_string.dart';
import '../generate_screen.dart';
import '../result_screen.dart';

class ForBusinessScreen extends StatefulWidget {
  const ForBusinessScreen({super.key});

  @override
  State<ForBusinessScreen> createState() => _ForBusinessScreenState();
}

class _ForBusinessScreenState extends State<ForBusinessScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // nameController.dispose();
    // industryController.dispose();
    // phoneController.dispose();
    // emailController.dispose();
    // websiteController.dispose();
    // addressController.dispose();
    // stateController.dispose();
    // countryController.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> code = [
      nameController,
      industryController,
      phoneController,
      emailController,
      websiteController,
      addressController,
      stateController,
      countryController
    ];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
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
                        "Business",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  spacing: 9,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.business_sharp,
                      size: 58,
                      color: CustomColor.goldColor,
                    ),
                    CustomTextField(
                      labelText: "Company Name",
                      controller: nameController,
                    ),
                    CustomTextField(
                      labelText: "Industry Name",
                      controller: industryController,
                    ),
                    CustomTextField(
                      labelText: "Phone",
                      controller: phoneController,
                    ),
                    CustomTextField(
                      labelText: "Email",
                      controller: emailController,
                    ),
                    CustomTextField(
                      labelText: "Website",
                      controller: websiteController,
                    ),
                    CustomTextField(
                      labelText: "Address",
                      controller: addressController,
                    ),
                    RowTextField(
                        controller1: stateController,
                        controller2: countryController,
                        labelText1: "State Name",
                        labelText2: "Country Name"),
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
