import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:rtad/data/model/unavailable.dart';
import 'package:rtad/data/repository.dart';

part 'unavailable_state.dart';

class UnavailableCubit extends Cubit<UnavailableState> {
  final Repository _repository = GetIt.I<Repository>();
  UnavailableCubit() : super(UnavailableInitial());

  void getDate(String city,String licenceNo,String officeId,String appointId){
    emit(LoadingDate());
    _repository.unavailableDate(city, licenceNo, officeId, appointId)
     .then((value){
       emit(SuccessDate(value));
     })
     .catchError((value){
       
       emit(FailDate('မအောင်မြင်ပါ'));
     });


  }
}
