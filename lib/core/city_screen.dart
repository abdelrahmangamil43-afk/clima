import 'package:flutter/material.dart';
import 'package:climaa/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white, // تضيف لون عشان يبان على الخلفية
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city,color: Colors.white),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                  ),
                  onChanged: (value){
                    cityName=value;
                  },
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  textStyle: kButtonTextStyle,
                ),
                onPressed: () {
                  // ضيف هنا الكود اللي يرجع الطقس
                  Navigator.pop(context,cityName);
                },
                child: Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
