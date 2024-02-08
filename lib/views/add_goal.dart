import 'package:breakdown/models/future_event.dart';
import 'package:breakdown/widgets/checkbox.dart';
import 'package:breakdown/widgets/datepicker.dart';
import 'package:breakdown/widgets/image-picker.dart';
import 'package:flutter/material.dart';
import 'package:breakdown/constants.dart';
import 'dart:io';

class AddGoal extends StatefulWidget {
  final Function onAddEvent;

  const AddGoal({Key? key, required this.onAddEvent}) : super(key: key);

  @override
  AddGoalState createState() => AddGoalState();
}

class AddGoalState extends State<AddGoal> {
  final _formKey = GlobalKey<FormState>();

  String milestoneTitle = '';
  String unitName = '';
  int desiredAmount = 0;
  int currentAmount = 0;
  bool useDate = true;
  DateTime pickedDate = DateTime.now();
  File? pickedImage;

  void handleImage(File image) {
    setState(() {
      pickedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text('Add a new milestone',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF20342E), Color(0xFF04946F)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ImagePickerWidget(onImagePicked: handleImage),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: kInputDecoration.copyWith(
                            labelText: "Milestone Name"),
                        onChanged: (value) {
                          milestoneTitle = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        }),
                    const SizedBox(height: 20.0),
                    CustomCheckbox(
                        onChange: () {
                          setState(() {
                            useDate = !useDate;
                          });
                        },
                        useDate: useDate),
                    useDate
                        ? Datepicker(
                            pickedDate: pickedDate,
                            onChange: (DateTime newValue) {
                              setState(() {
                                pickedDate = newValue;
                              });
                            })
                        : Column(children: [
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: kInputDecoration.copyWith(
                                  labelText: "What's the unit of measurement?"),
                              onChanged: (value) {
                                unitName = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name for your milestone';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: kInputDecoration.copyWith(
                                  labelText: "Desired amount"),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {
                                desiredAmount = int.parse(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name for your milestone';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: kInputDecoration,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                currentAmount = int.parse(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name for your milestone';
                                }
                                return null;
                              },
                            ),
                          ]),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green.shade900,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (useDate) {
                            final eventToAdd = FutureEvent(
                                date: pickedDate,
                                title: milestoneTitle,
                                unit: 'date',
                                imagePath: pickedImage?.path,
                                createdAt: DateTime.now());
                            widget.onAddEvent(eventToAdd);
                          } else {
                            final eventToAdd = CustomUnitEvent(
                                title: milestoneTitle,
                                createdAt: DateTime.now(),
                                imagePath: pickedImage?.path,
                                unitName: unitName,
                                amountRequired: desiredAmount,
                                amountAchieved: [
                                  ProgressRecord(
                                      amount: currentAmount,
                                      timestamp: DateTime.now())
                                ]);
                            widget.onAddEvent(eventToAdd);
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
