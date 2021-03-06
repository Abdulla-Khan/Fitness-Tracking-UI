// ignore_for_file: prefer_const_constructors

import 'package:fitness_ui/data/latest_workout.dart';
import 'package:fitness_ui/widget/chart_activity_status.dart';
import 'package:fitness_ui/widget/chart_sleep.dart';
import 'package:fitness_ui/widget/chart_workout_progress.dart';
import 'package:fitness_ui/widget/water_intake_progressbar.dart';
import 'package:fitness_ui/widget/water_intake_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(fontSize: 14, color: black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Abdullah',
                        style: TextStyle(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(LineIcons.bell),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [secondary, primary],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: [
                    Flexible(
                      child: SizedBox(
                        width: s.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'BMI (Body Mass Index)',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                            Text(
                              'You have a normal weight',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                            Container(
                              width: 95,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [fourthColor, thirdColor],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'View More',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [fourthColor, thirdColor],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        '20,3',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: white),
                      )),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today Target',
                        style: TextStyle(
                            fontSize: 17,
                            color: black,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/today_target_detail');
                        },
                        child: Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient:
                                  LinearGradient(colors: [secondary, primary])),
                          child: Center(
                            child: Text(
                              'Check',
                              style: TextStyle(fontSize: 13, color: white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text('Activity Status',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: black,
                  )),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: LineChart(
                        activityData(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Heart Rate',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: (s.width - 80) / 2,
                    height: 320,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.01),
                            spreadRadius: 20,
                            blurRadius: 10,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          WateIntakeProgressBar(),
                          SizedBox(width: 15),
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  'Water Intake',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      'Real Time Updates',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    WaterIntakeTimeLine(),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        width: (s.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sleep',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Flexible(child: LineChart(sleepData())),
                              ]),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: (s.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Calories',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          colors: [
                                            fourthColor,
                                            primary.withOpacity(0.5)
                                          ]),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '230 Cal',
                                            style: TextStyle(
                                                fontSize: 10, color: white),
                                          ),
                                        ),
                                      ),
                                    ))
                              ]),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workout Progress',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [secondary, primary],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Weekly',
                          style: TextStyle(
                            fontSize: 13,
                            color: white,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.01),
                    spreadRadius: 20,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ], borderRadius: BorderRadius.circular(30)),
                child: LineChart(workoutProgressData()),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Workout',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 13,
                      color: black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                  children: List.generate(latestWorkoutJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.01),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage(latestWorkoutJson[index]['img']),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Flexible(
                            child: SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    latestWorkoutJson[index]['title'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    latestWorkoutJson[index]['description'],
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: black.withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Stack(children: [
                                    Container(
                                      width: s.width,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: bgTextField,
                                      ),
                                    ),
                                    Container(
                                      width: s.width *
                                          (latestWorkoutJson[index]
                                              ['progressBar']),
                                      height: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          gradient: LinearGradient(colors: [
                                            primary,
                                            secondary,
                                          ])),
                                    ),
                                  ])
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary)),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 11,
                                color: primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}
