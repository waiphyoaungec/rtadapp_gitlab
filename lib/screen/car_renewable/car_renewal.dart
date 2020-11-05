import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rtad/bloc/car_renewable/cubit/car_renewable_cubit_check.dart';
import 'package:rtad/bloc/car_renewable/cubit/check_renewable_post_cubit.dart';
import 'package:rtad/bloc/car_renewable/unavailable/cubit/unavailable_cubit.dart';
import 'package:rtad/data/model/car_renewable/car_renewable_chcek/car_renewable.dart';
import 'package:rtad/data/model/car_renewable/car_renewable_chcek/result.dart';
import 'package:rtad/utils/constant.dart';
import 'package:rtad/utils/date_dialog.dart';
import 'package:rtad/utils/snackbar.dart';


class CarLicenceCheck extends StatelessWidget {
  final _city;
  final TextEditingController _licenceNo = TextEditingController();

  CarLicenceCheck(this._city);
  @override
  Widget build(BuildContext context) {
    print(_city);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Const.tool,
          title: Text('vehicle registration check'),
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<CarLicenceCubit>(
                create: (_) => CarLicenceCubit(),
              ),
              BlocProvider<UnavailableCubit>(
                create: (_) => UnavailableCubit(),
              ),
              BlocProvider<CheckRenewableCubit>(
                create: (_) => CheckRenewableCubit(),
              ),
            ],
            child: BlocBuilder<CarLicenceCubit, CarLicenceState>(
              builder: (context, state) {
                CarLicenceCubit carLicence = context.bloc<CarLicenceCubit>();
                if (state is SuccessToken) {
                  return CarForm(_city, _licenceNo.text, state.carLicenceModel);
                } else if (state is CarLicenceLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FailedToken) {
                  return Text(state.error);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ယာဉ်အမှတ်ရိုက်ထည့်ပါ'),
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
                          carLicence.getToken(_licenceNo.text, _city);
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

class CarForm extends StatefulWidget {
  final CarLicenceModel _carLicenceModel;
  final String _city;
  final String _licenceNo;
  CarForm(this._city, this._licenceNo, this._carLicenceModel);
  @override
  _CarFormState createState() =>
      _CarFormState(this._city, this._licenceNo, _carLicenceModel.result);
}

class _CarFormState extends State<CarForm> {
  final Results result;
  final String _city;
  final String _licenceNo;
  Office _officeName;
  ApponintmentType _apponintmentType;
  Slot _slot;
  ProgressDialog _progressDialog;
  String _officeId = "1";
  String _appointmentId = "1";
  List<String> _date = List();
  String _showDate = 'မရွေးချယ်ရသေးပါ။';

  _CarFormState(this._city, this._licenceNo, this.result) {
    _officeName = result.offices[0];
    _apponintmentType = result.appointmentTypes[0];
    _slot = result.slots[0];
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
                'Online Appointment Application Form \n(For Renewal Vehicle Registration)',
                style: TextStyle(fontSize: 20)),
          ),
          Center(
            child: Text(
              'မော်တော်ယာဉ်သက်တမ်းတိုး ယာဉ်စစ်ရက်ချိန်းရယူရန် လျှောက်လွှာပုံစံ',
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
                  getDate(
                      _licenceNo, _city, _officeId, _appointmentId, context);
                });
              },
            ),
          ),
          line(),
          Text('လျှောက်ထားမှု*'),
          Center(
            child: DropdownButton(
              value: _apponintmentType,
              isExpanded: true,
              hint: Text('လျှောက်ထားမှုပုံစံ ရွေးချယ်ရန်'),
              underline: SizedBox(),
              items: result.appointmentTypes.map((ApponintmentType office) {
                return DropdownMenuItem(
                    child: Text(
                      office.name,
                      overflow: TextOverflow.clip,
                    ),
                    value: office);
              }).toList(),
              onChanged: (ApponintmentType value) {
                setState(() {
                  _appointmentId = value.key.toString();
                  _apponintmentType = value;
                  _showDate = 'မရွေးချယ်ရသေးပါ။';
                  getDate(
                      _licenceNo, _city, _officeId, _appointmentId, context);
                });
              },
            ),
          ),
          line(),
          SizedBox(
            height: 5,
          ),
          BlocListener<UnavailableCubit, UnavailableState>(
            listener: (context, state) {
              _progressDialog.hide();
              if (state is SuccessDate) {
                _date.clear();
                setState(() {
                  state.date.result.dates.forEach((key, value) {
                    _date.add(value);
                  });
                });
              } else if(state is FailDate) {
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
                       context.createSnackBar('ရုံးနှင့်လျှောက်ထားမှုပုံစံကို ရွေးချယ်ပါ');
                    }
                  }),
              SizedBox(
                width: 50,
              ),
              Text('$_showDate')
            ],
          ),
          line(),
          Text('လာရောက်ဆောင်ရွက်မည့်အချိန်*'),
          Center(
            child: DropdownButton(
              value: _slot,
              hint: Text('လာရောက်ဆောင်ရွက်မည့်အချိန်ရွေးချယ်ရန်'),
              underline: SizedBox(),
              items: result.slots.map((Slot slot) {
                return DropdownMenuItem(
                    child: SizedBox(
                      width: 300,
                      child: Text(slot.name, overflow: TextOverflow.visible),
                    ),
                    value: slot);
              }).toList(),
              onChanged: (Slot value) {
                setState(() {
                  _slot = value;
                });
              },
            ),
          ),
          line(),
          BlocListener<CheckRenewableCubit, CheckRenewableState>(
            listener: (context, state) {
              if(state is CheckRenewableInitial) {
                  _progressDialog.show();
              }
              else if(state is SuccessRenewable){
                _progressDialog.hide();
              }
              else if (state is FailedRenewable) {
                _progressDialog.hide();
                context.createSnackBar(state.error);
              }
            },
            child: RaisedButton(
                color: Const.tool,
                textColor: Colors.white,
                child: Text('စစ်ဆေးရန်'),
                
                onPressed: () {
                  if(_showDate == 'မရွေးချယ်ရသေးပါ။'){
                  context.createSnackBar("Date မရွေးချယ်ရသေးပါ။");
                }
                else
                  BlocProvider.of<CheckRenewableCubit>(context).check(
                      _city,
                      _licenceNo,
                      _officeId,
                      _appointmentId,
                      _showDate,
                      _licenceNo);
                }),
          )
        ]),
      ),
    );
  }

  getDate(String licenceNo, String city, String office, String appointId,
      BuildContext context,
      ) async {
    if (office == null || appointId == null) {
      print('null');
    } else {
      UnavailableCubit unavailableCubit =
          BlocProvider.of<UnavailableCubit>(context);
      unavailableCubit.getDate(city, licenceNo, office, appointId);
      await _progressDialog.show();
      
    }
  }

  line() => Container(
        color: Const.tool,
        width: double.infinity,
        height: 3,
      );
}
