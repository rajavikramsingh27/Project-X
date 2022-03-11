import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:task_planner/Controllers/CreateNewTaskController.dart';
import 'package:task_planner/screens/home_page.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:task_planner/widgets/button/back_button.dart';
import 'package:task_planner/widgets/my_text_field.dart';
import 'package:task_planner/widgets/top_container.dart';
import 'package:intl/intl.dart';

class CreateNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    final controller = Get.put(CreateNewTaskController());

    return Scaffold(
      body: GetBuilder(
        init: CreateNewTaskController(),
        initState: (state) {
          controller.reset();
          print(controller.yesandno.value);

        },
        builder: (authController) {
          return Obx(() =>    SafeArea(
            child: Column(
              children: <Widget>[
                TopContainer(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  child: Column(
                    children: <Widget>[
                      MyBackButton(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Create new task',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyTextField(label: 'Title'),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                      child: TextField(
                                        controller: controller.txtDate.value,
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
                                            controller.txtDate.value.text = formattedDate;

                                            Get.focusScope.unfocus();
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      )

                                  ),

                                  HomePage.calendarIcon(),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Expanded(
                              child: MyTextField(
                                label: 'Start Time',
                                icon: downwardIcon,
                              ),
                            ),
                            SizedBox(width: 40),
                            Expanded(
                              child: MyTextField(
                                label: 'End Time',
                                icon: downwardIcon,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        MyTextField(
                          label: 'Description',
                          minLines: 3,
                          maxLines: 3,
                        ),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                //direction: Axis.vertical,
                                alignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                runSpacing: 0,
                                //textDirection: TextDirection.rtl,
                                spacing: 10.0,
                                children: <Widget>[
                                  InkWell(
                                    child:   Chip(
                                      label: Text("SPORT APP"),
                                      // backgroundColor: LightColors.kRed,
                                      backgroundColor:  (controller.yesandno.value == 0)
                            ? LightColors.kRed

                            :  Colors.black12,

                                      labelStyle: TextStyle(
                                          // color: Colors.white
                                        color: (controller.yesandno.value == 0)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: (){

                                      controller.agree.value = !controller.agree.value;
                                      controller.yesandno.value = 0;
                                    },
                                  ),
                                  InkWell(
                                    child:   Chip(
                                      label: Text("MEDICAL APP"),
                                      backgroundColor:  (controller.yesandno.value == 1)
                                          ? LightColors.kRed

                                          :  Colors.black12,
                                      labelStyle: TextStyle(
                                        // color: Colors.white
                                        color: (controller.yesandno.value == 1)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: (){

                                      controller.agree.value = !controller.agree.value;
                                      controller.yesandno.value = 1;
                                    },
                                  ),
                                  InkWell(
                                    child:   Chip(
                                      label: Text("RENT APP"),
                                      backgroundColor:  (controller.yesandno.value == 2)
                                          ? LightColors.kRed

                                          :  Colors.black12,
                                      labelStyle: TextStyle(
                                        // color: Colors.white
                                        color: (controller.yesandno.value == 2)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: (){

                                      controller.agree.value = !controller.agree.value;
                                      controller.yesandno.value = 2;
                                    },
                                  ),
                                  InkWell(
                                    child:    Chip(
                                      label: Text("NOTES"),
                                      backgroundColor:  (controller.yesandno.value == 3)
                                          ? LightColors.kRed

                                          :  Colors.black12,
                                      labelStyle: TextStyle(
                                        // color: Colors.white
                                        color: (controller.yesandno.value == 3)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: (){

                                      controller.agree.value = !controller.agree.value;
                                      controller.yesandno.value = 3;
                                    },
                                  ),
                                  InkWell(
                                    child:    Chip(
                                      label: Text("GAMING PLATFORM APP"),
                                      backgroundColor:  (controller.yesandno.value == 4)
                                          ? LightColors.kRed

                                          :  Colors.black12,
                                      labelStyle: TextStyle(
                                        // color: Colors.white
                                        color: (controller.yesandno.value == 4)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onTap: (){

                                      controller.agree.value = !controller.agree.value;
                                      controller.yesandno.value = 4;
                                    },
                                  ),





                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Create Task',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: LightColors.kBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),);
        },
      )


    );
  }
}
