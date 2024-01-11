import 'dart:math';

import 'package:flutter/material.dart';

import '../components/constant.dart';
import 'bmi_result.dart';

class BmiCalcScreen extends StatefulWidget {
  static String id = 'Bmi_Calc';
  @override
  State<BmiCalcScreen> createState() => _BmiCalcScreenState();
}

class _BmiCalcScreenState extends State<BmiCalcScreen> {
  bool isMale = true;

  double height = 120.0;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isMale ? kPrimaryColor : Colors.grey[400],
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isMale ? Colors.grey[400] : kPrimaryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 100.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                              ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                        const Text('CM'),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 120.0,
                      max: 220.0,
                      activeColor:kPrimaryColor,
                      inactiveColor: Colors.grey[200],
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                        print(value.round());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${weight.round()}',
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                backgroundColor: kPrimaryColor,
                                clipBehavior: Clip.none,
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    Icons.minimize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                backgroundColor: kPrimaryColor,
                                child: const Icon(
                                  Icons.add,color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${age}',
                            style: const TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: kPrimaryColor,
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Icon(
                                    Icons.minimize,color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: kPrimaryColor,
                                child: const Icon(
                                  Icons.add,color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                double score = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BmiResScreen(
                            bmiScore: score,
                            age: age,

                          )),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color:kPrimaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
