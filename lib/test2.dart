
import 'dart:math' as math;


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedStartDate = '2023-12-07';
  String selectedEndDate = '2023-12-07';
  List<double> mainKWData = [];
  List<double> mainAData = [];
  List<double> mainPFData = [];
  double sumMainKW = 0.0;
  double sumMainA = 0.0;
  double sumMainPF = 0.0;
  String apiUrl = 'http://203.135.63.22:8000/data';
  int touchedIndex = -1;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?username=ppjiq&mode=hour&start=$selectedStartDate&end=$selectedEndDate'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['data'] != null) {
          setState(() {
            mainKWData = List<double>.from(responseData['data']['Main_[kW]']);
            mainAData = List<double>.from(responseData['data']['Main_[A]']);
            mainPFData = List<double>.from(responseData['data']['Main_[PF]']);

            sumMainKW = mainKWData.reduce((value, element) => value + element);
            sumMainA = mainAData.reduce((value, element) => value + element);
            sumMainPF = mainPFData.reduce((value, element) => value + element);
          });
        }
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Data in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedStartDate,
                    items: ['2023-12-07', '2023-12-08', '2023-12-09'] // Add your date options here
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedStartDate = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedEndDate,
                    items: ['2023-12-07', '2023-12-08', '2023-12-09'] // Add your date options here
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedEndDate = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 16),
            mainKWData.isNotEmpty
                ? Expanded(
              child: Column(
                children: [
                  Text('Sum of Main_[kW]: $sumMainKW'),
                  Text('Sum of Main_[A]: $sumMainA'),
                  Text('Sum of Main_[PF]: $sumMainPF'),
                  SizedBox(height: 16),
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: touchedIndex == 0 ? Colors.blue : getRandomColor(),
                            value: sumMainKW,
                            title: 'Main_[kW]',
                            radius: 60,
                          ),
                          PieChartSectionData(
                            color: touchedIndex == 1 ? Colors.blue : getRandomColor(),
                            value: sumMainA,
                            title: 'Main_[A]',
                            radius: 60,
                          ),
                          PieChartSectionData(
                            color: touchedIndex == 2 ? Colors.blue : getRandomColor(),
                            value: sumMainPF,
                            title: 'Main_[PF]',
                            radius: 60,
                          ),
                        ],
                        sectionsSpace: 0,
                        centerSpaceRadius: 50,
                        startDegreeOffset: -90,
                        // handle selection event
                        // onSelectChanged: (value, index, selected) {
                        //   setState(() {
                        //     touchedIndex = selected ? index : -1;
                        //   });
                        // },
                      ),
                    ),
                  ),
                ],
              ),
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }
}


