import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_planner/Controllers/InfoController.dart';
import 'package:task_planner/screens/home_page.dart';
import 'package:task_planner/screens/project/estimate.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:task_planner/widgets/button/back_button.dart';
import 'package:task_planner/widgets/my_text_field.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';



class ProjectInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    final controller = Get.put(InfoController());

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: GetBuilder(
        init: InfoController(),
        initState: (state) {
          // controller.reset();

        },
        builder: (authController) {
          return Obx(() =>   SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      SizedBox(height: 30.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Create new project',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  MyTextField(

                                      controller: controller.txtTitle.value,
                                      label: 'Title'),
                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                          child: TextField(
                                            controller: controller.txtStartDate.value,
                                            style: TextStyle(color: Colors.black87),
                                            minLines: 1,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                                suffixIcon: downwardIcon,
                                                labelText: 'Start Date',
                                                labelStyle: TextStyle(color: Colors.black45),
                                                focusedBorder:
                                                UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                border:
                                                UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                            onTap: () async {
                                              DateTime pickedDate = await showDatePicker(
                                                  context: context, initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101)
                                              );
                                              if(pickedDate != null ) {
                                                print(pickedDate);
                                                String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
                                                print(formattedDate);
                                                controller.txtStartDate.value.text = formattedDate;

                                                Get.focusScope.unfocus();
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          )

                                      ),
                                      HomePage.calendarIcon(),
                                    ],
                                  ),
                                  SizedBox(height: 20),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                          child: TextField(
                                            controller: controller.txtEndDate.value,
                                            style: TextStyle(color: Colors.black87),
                                            minLines: 1,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                                suffixIcon: downwardIcon,
                                                labelText: 'End Date',
                                                labelStyle: TextStyle(color: Colors.black45),
                                                focusedBorder:
                                                UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                                border:
                                                UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
                                            onTap: () async {
                                              DateTime pickedDate = await showDatePicker(
                                                  context: context, initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101)
                                              );
                                              if(pickedDate != null ) {
                                                print(pickedDate);
                                                String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
                                                print(formattedDate);
                                                controller.txtEndDate.value.text = formattedDate;

                                                Get.focusScope.unfocus();
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          )

                                      ),
                                      // Expanded(
                                      //   child: MyTextField(
                                      //     label: 'End Date',
                                      //     icon: downwardIcon,
                                      //   ),
                                      // ),
                                      HomePage.calendarIcon(),
                                    ],
                                  ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   children: <Widget>[
                                  //     Expanded(
                                  //       child:  DateTimePicker(
                                  //
                                  //         // initialValue: '',
                                  //         //   icon: downwardIcon,
                                  //           dateMask: 'dd, MMM, yyyy',
                                  //           firstDate: DateTime(2000),
                                  //           lastDate: DateTime(2050),
                                  //           dateLabelText: 'End Date',
                                  //
                                  //           // dateHintText: 'Date Of Birth',
                                  //           onChanged: (date) {
                                  //             // controller.dateOfBirth.value = date;
                                  //           },
                                  //           validator: (value) {
                                  //             if (value == null || value.isEmpty) {
                                  //               return 'Please enter the Date Of Birth';
                                  //             }
                                  //             return null;
                                  //           },
                                  //           onSaved: (val) => print("On Saved")
                                  //       ),
                                  //
                                  //       // MyTextField(
                                  //       //   label: 'End Date',
                                  //       //   icon: downwardIcon,
                                  //       // ),
                                  //     ),
                                  //     HomePage.calendarIcon(),
                                  //   ],
                                  // ),

                                  SizedBox(height: 20),
                                  MyTextField(
                                      controller: controller.txtPriceRange.value,
                                      label: 'Price range'
                                  ),
                                  MyTextField(
                                    controller: controller.txtDescripition.value,
                                    label: 'Description',
                                    minLines: 3,
                                    maxLines: 3,
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 80,
                                    width: width,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            print( controller.txtTitle.value,);
                                            print( controller.txtStartDate.value,);
                                            print( controller.txtEndDate.value,);
                                            print( controller.txtPriceRange.value,);
                                            print( controller.txtDescripition.value,);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProjectEstimatePage(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Text(
                                              'Create Task',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                            width: width - 120,
                                            decoration: BoxDecoration(
                                              color: LightColors.kBlue,
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),);
        },
      )


    );
  }
}
