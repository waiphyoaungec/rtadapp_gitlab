import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rtad/utils/navigator.dart';

import 'car_check/vehicle_check_screen.dart';
import 'car_renewable/car_renewal.dart';
import 'driving/driving_screen.dart';

class Service extends StatelessWidget {
  final _code = Random().nextInt(1000);
  final _licenceNo = '1A/1001';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // _item('ရန်ကုန်',['ယာဉ်မောင်းလိုင်စင် သက်တမ်းတိုး',"မော်တော်ယာဉ်သက်တမ်းတိုး",
        // 'မန္တလေးတိုင်း မှတ်ပုံတင်ယာဉ် မှန်ကန်ခြင်း ရှိ /မရှိ စစ်ဆေးရန်',]),
        _item('ရန်ကုန်', [
          "Car Renewal",
          "Vehicle Registration Check",
          "Driving Licence"
        ],'ygn'),
        _item('မန္တလေး', [
          "Car Renewal",
          "Vehicle Registration Check",
          "Driving Licence"
        ],'mdy'),
        _item('ပဲခူး', [
          "Car Renewal",
        ],'bgo'),
      ]),
    );
  }

  _item(title, List<String> list,String key) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, position) {
                return MaterialButton(
                    onPressed: () {
                      if(list[position] == 'Car Renewal')
                      context.next(CarLicenceCheck(key));
                      if(list[position] == 'Vehicle Registration Check')
                      context.next(VehicleRegistrationCheck(key));
                      if(list[position] == "Driving Licence")
                      context.next(DrivingScreen(key));
                      },
                    color: Color.fromARGB(255, 14, 94, 127),
                    textColor: Colors.white,
                    child: Text(
                      list[position],
                    ));
              })
        ],
      ),
    );
  }
}
