import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';

import '../../provider/db_provider.dart';
import '../../provider/toggle_provider.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../../widgets/uihelper/color.dart';
import '../../widgets/uihelper/concat_string.dart';
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
                        Navigator.pop(context);
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
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: CustomColor.barBgColor.withAlpha(150),
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColor.goldColor, width: 2)),
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
                          labelText2: "Job",
                          isRequired1: false,
                          isRequired2: false,
                        ),
                        CustomTextField(
                          labelText: "phone",
                          controller: phoneController,
                        ),
                        CustomTextField(
                          labelText: "Email",
                          controller: emailController,
                          isRequired: false,
                        ),
                        CustomTextField(
                          labelText: "Address",
                          controller: addressController,
                          isRequired: false,
                        ),
                        RowTextField(
                          controller1: cityController,
                          controller2: countryController,
                          labelText1: "City",
                          labelText2: "Country",
                          isRequired1: false,
                          isRequired2: false,
                        ),
                        GenerateQrButton(
                          onTap: () async {
                            if (firstNameController.text.isNotEmpty &&
                                lastNameController.text.isNotEmpty &&
                                phoneController.text.isNotEmpty) {
                              final date = DateTime.now();
                              String d =
                                  "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
                              context.read<ToggleProvider>().vibrate();
                              context.read<DBProvider>().addData(
                                  code: concatenateString(code).text,
                                  date: DateTime.now(),
                                  isCreate: true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      code: concatenateString(code).text,
                                      date: d,
                                    ),
                                  ));
                            } else {
                              flushBarMessage(
                                  context, "Enter required details !");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
