import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

import '../components/constant.dart';

class BmiResScreen extends StatelessWidget {
    BmiResScreen({super.key, required this.bmiScore,required this.age});

  final double bmiScore;
  final int age;

  String? bmiStatus, bmiInterpretation;
  Color? bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('BMI Score'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child:   Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your Score',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30
              ),),
              const SizedBox(height: 10,),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('UnderWeight', 18.5, Colors.red),
                  GaugeSegment('Normal', 6.4, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.orange),
                  GaugeSegment('Obese', 10.1, Colors.pink),
                ],
                valueWidget: Text(bmiScore.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 40,
                ),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.blue,
              ),
              const SizedBox(height: 10,),
              Text(bmiStatus!,
              style: TextStyle(
                fontSize: 20,
                color: bmiStatusColor!,
              ),),
              const SizedBox(height: 10,),
              Text(bmiInterpretation!,
                style: const TextStyle(
                  fontSize: 15
                ),),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 3),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Center(
                      child: Text(
                        'Re-CALCULATE',
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
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore>30){
      bmiStatus= "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    }

    else if (bmiScore>=25){
      {
        bmiStatus= "OverWeight";
        bmiInterpretation = "Do regular exercise & reduce the weight";
        bmiStatusColor = Colors.orange;
      }
    }
    else if (bmiScore>=18.5){
      {
        bmiStatus= "Normal";
        bmiInterpretation = "Enjoy, you are fit";
        bmiStatusColor = Colors.green;
      }
    }
    else if (bmiScore<18.5){
      {
        bmiStatus= "UnderWeight";
        bmiInterpretation = "Try to increase the weight";
        bmiStatusColor = Colors.red;
      }
    }
  }
}
