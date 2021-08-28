import 'package:flutter/material.dart';
import 'package:flutter_workshop/global.dart';
import 'package:flutter_workshop/models/weather_model.dart';
import 'package:flutter_workshop/services/database.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherModel? weather;
  final TextEditingController weatherController = TextEditingController();

  bool validateInput() {
    if (weatherController.text.length < 2) {
      showSnackbar('Please Enter Valid City Name', Status.FAILED);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: weatherController,
                decoration: InputDecoration(
                    hintText: 'Enter City',
                    labelText: 'Enter City',
                    suffixIcon: IconButton(
                        onPressed: () {
                          weatherController.text = '';
                        },
                        icon: Icon(Icons.cancel)),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () async {
                    if (validateInput()) {
                      var data =
                          await Database().getWeather(weatherController.text);
                      if (data != false) {
                        setState(() {
                          weather = data;
                        });
                      }
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: Text(
                    'Check Weather',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 70,
              ),
              if (weather != null)
                Column(
                  children: [
                    Text(
                      '${weather!.tempC.toString()} C',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.network('https:${weather!.condition!.icon}'),
                    Text(
                      weather!.condition!.text ?? '',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
