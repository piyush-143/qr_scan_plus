import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import '../../provider/toggle_provider.dart';
import '../../widgets/uihelper/color.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../../widgets/uihelper/concat_string.dart';
import '../generate_screen.dart';
import '../result_screen.dart';

class ForContactScreen extends StatefulWidget {
  const ForContactScreen({super.key});

  @override
  State<ForContactScreen> createState() => _ForContactScreenState();
}

class _ForContactScreenState extends State<ForContactScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // firstNameController.dispose();
    // lastNameController.dispose();
    // companyNameController.dispose();
    // jobNameController.dispose();
    // phoneController.dispose();
    // emailController.dispose();
    // addressController.dispose();
    // cityController.dispose();
    // countryController.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> code = [
      firstNameController,
      lastNameController,
      companyNameController,
      jobNameController,
      phoneController,
      emailController,
      addressController,
      cityController,
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
                        "Contact",
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
                      Icons.perm_contact_cal_rounded,
                      size: 58,
                      color: CustomColor.goldColor,
                    ),
                    RowTextField(
                        controller1: firstNameController,
                        controller2: lastNameController,
                        labelText1: "First Name",
                        labelText2: "Last Name"),
                    RowTextField(
                        controller1: companyNameController,
                        controller2: jobNameController,
                        labelText1: "Company",
                        labelText2: "Job"),
                    CustomTextField(
                      labelText: "phone",
                      controller: phoneController,
                    ),
                    CustomTextField(
                      labelText: "Email",
                      controller: emailController,
                    ),
                    CustomTextField(
                      labelText: "Address",
                      controller: addressController,
                    ),
                    RowTextField(
                        controller1: cityController,
                        controller2: countryController,
                        labelText1: "City",
                        labelText2: "Country"),
                    GenerateQrButton(
                      onTap: () async {
                        await player.setAsset("assets/audio/beepSound.mp3");
                        context.read<ToggleProvider>().vibBeep(player);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                code: concatenateString(code).text,
                                navBack: GenerateScreen(),
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
