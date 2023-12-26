import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {
  Config? config;

  Data({this.config});

  Data.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (config != null) {
      data['config'] = config!.toJson();
    }
    return data;
  }
}

class Config {
  List<String>? newName;
  List<String>? oldName;
  List<String>? voltage;
  List<String>? current;
  List<String>? power;
  List<String>? powerFactor;
  List<String>? color;

  Config({
    this.newName,
    this.oldName,
    this.voltage,
    this.current,
    this.power,
    this.powerFactor,
    this.color,
  });

  Config.fromJson(Map<String, dynamic> json) {
    newName = json['new_name']?.cast<String>();
    oldName = json['old_name']?.cast<String>();
    voltage = json['Voltage']?.cast<String>();
    current = json['Current']?.cast<String>();
    power = json['Power']?.cast<String>();
    powerFactor = json['PowerFactor']?.cast<String>();
    color = json['Color']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['new_name'] = newName;
    data['old_name'] = oldName;
    data['Voltage'] = voltage;
    data['Current'] = current;
    data['Power'] = power;
    data['PowerFactor'] = powerFactor;
    data['Color'] = color;
    return data;
  }
}


class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}
class _YourWidgetState extends State<YourWidget> {
  Future<Data> fetchData() async {
    final response = await http.get(Uri.parse('http://203.135.63.22:8000/config?username=ppjp5'));

    if (response.statusCode == 200) {
      return Data.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API Integration'),
      ),
      body: FutureBuilder<Data>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Use the data here
            Data data = snapshot.data!;
            return ListView.builder(
              itemCount: data.config?.newName?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data.config?.newName?[index] ?? '',style: TextStyle(
                  
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Old Name: ${data.config?.oldName?[index] ?? ''}'),
                        Text('Voltage: ${data.config?.voltage?[index] ?? ''}'),
                        Text('Current: ${data.config?.current?[index] ?? ''}'),
                        Text('Power: ${data.config?.power?[index] ?? ''}'),
                        Text('Power Factor: ${data.config?.powerFactor?[index] ?? ''}'),
                      ],
                    ),
                    // Add more fields as needed
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

