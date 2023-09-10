import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helpers/local_storage_helper.dart';
import 'package:weather_app/translation/app_translations.dart';

part  'localization_state.dart';
class LocalizationCubit extends Cubit<LocalizationState>{
  LocalizationCubit() : super(LocalizationInitial()){
    init();
  }

  void init() async{
  final Locale locale = await LocalStorageHelper.getLocale();
  emit(LocalizationFetched(locale));
  }
  
  void english() async {
    const Locale englishLocale = AppTranslation.english;
    await LocalStorageHelper.setLocal(englishLocale);
    emit(LocalizationFetched(englishLocale));
  }

  void arabic() async {
    const Locale arabicLocale = AppTranslation.arabic;
    await LocalStorageHelper.setLocal(arabicLocale);
    emit(LocalizationFetched(arabicLocale));
  }
}


