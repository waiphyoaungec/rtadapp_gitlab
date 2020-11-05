import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rtad/bloc/car_renewable/cubit/check_renewable_post_cubit.dart';
import 'package:rtad/bloc/vehicle_check/cubit/vehicle_check_cubit.dart';
import 'package:rtad/bloc/vehicle_check/cubit/vehicle_check_post_cubit.dart';
import 'package:rtad/bloc/vehicle_check/cubit/vehicle_check_unavailable_cubit.dart';
import 'package:rtad/data/model/car_check/check/car_check.dart';
import 'package:rtad/data/model/car_check/check/result.dart';
import 'package:rtad/utils/constant.dart';
import 'package:rtad/utils/date_dialog.dart';
import 'package:rtad/utils/snackbar.dart';

class VehicleRegistrationCheck extends StatelessWidget {
  final String _city;
  final TextEditingController _licenceNo = TextEditingController();

  VehicleRegistrationCheck(this._city);
  @override
  Widget build(BuildContext context) {
    print(_city);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Const.tool,
          title: Text('ယာဉ်လိုင်စင်သက်တန်းတိုးလျှောက်ထားရန်'),
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<VehicleCheckCubit>(
                create: (_) => VehicleCheckCubit(),
              ),
              BlocProvider<VehicleCheckUnavailableCubit>(
                create: (_) => VehicleCheckUnavailableCubit(),
              ),
              BlocProvider<VehicleCheckPostCubit>(
                create: (_) => VehicleCheckPostCubit(),
              ),
            ],
            child: BlocBuilder<VehicleCheckCubit, VehicleCheckState>(
              builder: (context, state) {
                VehicleCheckCubit vehicleCheckCubit =
                    context.bloc<VehicleCheckCubit>();
                if (state is VehicleCehckSuccess) {
                  return VehicleForm(
                      _city, _licenceNo.text, state.vehicleLicenceCheck);
                } else if (state is VehicleCheckLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is VehicleCheckFail) {
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
                          vehicleCheckCubit.vehicleCheck(
                              licenceNo: _licenceNo.text, city: _city);
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

class VehicleForm extends StatefulWidget {
  final VehicleLicenceCheck _carLicenceModel;
  final String _city;
  final String _licenceNo;
  VehicleForm(this._city, this._licenceNo, this._carLicenceModel);
  @override
  _CarFormState createState() =>
      _CarFormState(this._city, this._licenceNo, _carLicenceModel.result);
}

class _CarFormState extends State<VehicleForm> {
  final Results result;
  final String _city;
  final String _licenceNo;
  Office _officeName;
  ProgressDialog _progressDialog;
  String _officeId = "1";
  List<String> _date = List();
  String _showDate = 'မရွေးချယ်ရသေးပါ။';

  _CarFormState(this._city, this._licenceNo, this.result) {
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
          BlocListener<VehicleCheckUnavailableCubit,
              VehicleCheckUnavailableState>(
            listener: (context, state) {
              _progressDialog.hide();
              if (state is VehicleCheckUnavailableSuccess) {
                _date.clear();
                setState(() {
                  state.unavailable.result.dates.forEach((key, value) {
                    _date.add(value);
                  });
                });
              } else if (state is VehicleCheckUnavailableFail) {
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
          BlocListener<VehicleCheckPostCubit, VehicleCheckPostState>(
            listener: (context, state) {
              if (state is VehicleCheckPostInitial) {
                _progressDialog.show();
              } else if (state is VehicleCheckPostSuccess) {
                _progressDialog.hide();
              } else if (state is VehicleCheckPostFail) {
                _progressDialog.hide();
                context.createSnackBar(state.error);
              }
            },
            child: RaisedButton(
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
          )
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
      VehicleCheckUnavailableCubit unavailableCubit =
          BlocProvider.of<VehicleCheckUnavailableCubit>(context);
      unavailableCubit.getDate(
          city: city, licenceNo: licenceNo, officeId: office);
      await _progressDialog.show();
    }
  }

  line() => Container(
        color: Const.tool,
        width: double.infinity,
        height: 3,
      );
}
