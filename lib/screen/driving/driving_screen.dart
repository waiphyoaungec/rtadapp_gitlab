import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rtad/bloc/driving/check/cubit/drivingcheck_cubit.dart';
import 'package:rtad/bloc/driving/unavailable/cubit/driving_unavailable_cubit.dart';

import 'package:rtad/bloc/vehicle_check/cubit/vehicle_check_post_cubit.dart';
import 'package:rtad/data/model/driving/check/driving_check.dart';
import 'package:rtad/data/model/driving/check/result.dart';
import 'package:rtad/utils/constant.dart';
import 'package:rtad/utils/date_dialog.dart';
import 'package:rtad/utils/snackbar.dart';

class DrivingScreen extends StatelessWidget {
  final String _city;
  final TextEditingController _licenceNo = TextEditingController();

  DrivingScreen(this._city);
  @override
  Widget build(BuildContext context) {
    print(_city);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Const.tool,
          title: Text('ယာဉ်မောင်းလိုင်စင်'),
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<DrivingcheckCubit>(
                create: (_) => DrivingcheckCubit(),
              ),
              BlocProvider<DrivingUnavailableCubit>(
                create: (_) => DrivingUnavailableCubit(),
              ),
              // BlocProvider<VehicleCheckPostCubit>(
              //   create: (_) => VehicleCheckPostCubit(),
              // ),
            ],
            child: BlocBuilder<DrivingcheckCubit, DrivingcheckState>(
              builder: (context, state) {
                if (state is DrivingCheckSuccess) {
                  return DrivingForm(
                      _city, _licenceNo.text, state.drivingCheck);
                } else if (state is DrivingCheckLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DrivingCheckFail) {
                  return Text(state.error);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('လိုင်စင်အမှတ်ရိုက်ထည့်ပါ'),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: TextField(
                        controller: _licenceNo,
                        decoration: InputDecoration(
                            hintText: '1A/1001', border: OutlineInputBorder()),
                      ),
                    ),
                    RaisedButton(
                        onPressed: () {
                          BlocProvider.of<DrivingcheckCubit>(context).drivingCheck(
                          _city,_licenceNo.text
                          );
                         
                        },
                        color: Const.tool,
                        textColor: Colors.white,
                        child: Text('လျှောက်ထားရန်'))
                  ],
                );
              },
            )));
  }
}

class DrivingForm extends StatefulWidget {
  final DrivingCheck _carLicenceModel;
  final String _city;
  final String _licenceNo;
  DrivingForm(this._city, this._licenceNo, this._carLicenceModel);
  @override
  _DrivingFormState createState() =>
      _DrivingFormState(this._city, this._licenceNo, _carLicenceModel.result);
}

class _DrivingFormState extends State<DrivingForm> {
  final DrivingResult result;
  final String _city;
  final String _licenceNo;
  Office _officeName;
  ProgressDialog _progressDialog;
  String _officeId = "1";
  List<String> _date = List();
  String _showDate = 'မရွေးချယ်ရသေးပါ။';

  _DrivingFormState(this._city, this._licenceNo, this.result) {
    _officeName = result.offices[0];
  }
  @override
  Widget build(BuildContext context) {
    _progressDialog = ProgressDialog(context);
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Text(
                'Online Appointment Application Form \n(For Vehicle Registration Check)',
                style: TextStyle(fontSize: 20)),
          ),
          Center(
            child: Text(
              'မော်တော်ယာဉ်စစ်ဆေး  လျှောက်လွှာပုံစံ',
              textAlign: TextAlign.center,
            ),
          ),
          line(),
          Text('လာရောက်ဆောင်ရွက်မည့်ရုံး*'),
          Center(
            child: DropdownButton(
              isExpanded: true,
              value: _officeName,
              hint: Text('ဆောင်ရွက်မည့်ရုံးရွေးချယ်ရန်'),
              underline: SizedBox(),
              items: result.offices.map((Office office) {
                return DropdownMenuItem(
                    child: Text(
                      office.name,
                    ),
                    value: office);
              }).toList(),
              onChanged: (Office value) {
                setState(() {
                  _officeId = value.key.toString();
                  _officeName = value;
                  _showDate = 'မရွေးချယ်ရသေးပါ။';
                  getDate(_licenceNo, _city, _officeId, context);
                });
              },
            ),
          ),
          line(),
          SizedBox(
            height: 5,
          ),
          BlocListener<DrivingUnavailableCubit,
              DrivingUnavailableState>(
            listener: (context, state) {
              _progressDialog.hide();
              if (state is DrivingUnavailableSuccess) {
                _date.clear();
                setState(() {
                  state.unavailable.result.dates.forEach((key, value) {
                    _date.add(value);
                  });
                });
              } else if (state is DrivingUnavailableFail) {
                print(state.error.toString());
                context.createSnackBar('မှားယွင်းနေပါသည်');
              }
            },
            child: Text('လာရောက်ဆောင်ရွက်မည့်နေ့*'),
          ),
          Row(
            children: [
              RaisedButton(
                  color: Const.tool,
                  textColor: Colors.white,
                  child: Text('ရွေးချယ်ရန်'),
                  onPressed: () {
                    if (_date != null && _date.length > 0) {
                      showDate(_date, Const.tool, context, selected: (date) {
                        setState(() {
                          _showDate = date;
                        });
                      });
                    } else {
                      context.createSnackBar(
                          'ရုံးနှင့်လျှောက်ထားမှုပုံစံကို ရွေးချယ်ပါ');
                    }
                  }),
              SizedBox(
                width: 50,
              ),
              Text('$_showDate')
            ],
          ),
          line(),
          RaisedButton(
                color: Const.tool,
                textColor: Colors.white,
                child: Text('စစ်ဆေးရန်'),
                onPressed: () {
                  if(_showDate == "မရွေးချယ်ရသေးပါ။"){
                    context.createSnackBar("Date မရွေးချယ်ရသေးပါ။");
                  }
                  else
                  BlocProvider.of<VehicleCheckPostCubit>(context)
                      .vehicleCheckPost(
                          city: _city,
                          licence_no: _licenceNo,
                          officeId: _officeId,
                          appointmentDate: _showDate,
                          vehicleNo: _licenceNo);
                }),
        ]),
      ),
    );
  }

  getDate(
    String licenceNo,
    String city,
    String office,
    BuildContext context,
  ) async {
    if (office == null) {
      print('null');
    } else {
      DrivingUnavailableCubit unavailableCubit =
          BlocProvider.of<DrivingUnavailableCubit>(context);
      unavailableCubit.getDrivingUnavailable(
          city,licenceNo,office);
      await _progressDialog.show();
    }
  }

  line() => Container(
        color: Const.tool,
        width: double.infinity,
        height: 3,
      );
}
