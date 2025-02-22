import 'package:flutter/material.dart';

import '../../widgets/color.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../generate_screen.dart';

class ForContactScreen extends StatelessWidget {
  const ForContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController companyNameController = TextEditingController();
    TextEditingController jobNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController websiteController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
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
              child: Expanded(
                child: Column(
                  spacing: 22,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.perm_contact_cal_rounded,
                      size: 68,
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
                    RowTextField(
                        controller1: phoneController,
                        controller2: emailController,
                        labelText1: "Phone",
                        labelText2: "Email"),
                    CustomTextField(
                      labelText: "Website",
                      controller: websiteController,
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
                    SizedBox(height: 1),
                    GenerateQrButton(onTap: () {}),
                    SizedBox(height: 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
