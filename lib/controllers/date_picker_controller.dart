import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:you_app_demo/models/user_model.dart';

class DatePickerController extends GetxController {
  Rx<String> selectedDate = 'DD MM YYYY'.obs;
  Rx<String> zodiac = '--'.obs;
  Rx<String> horoscope = '--'.obs;
  DateTime initialDate = DateTime.now();
  DateTime eighteenYearsOld = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

  void selectDate(BuildContext context, UserModel? user) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: eighteenYearsOld,
      firstDate: DateTime(1900),
      lastDate: eighteenYearsOld,
    );
    if (picked != null && picked != initialDate) {
      selectedDate.value = DateFormat('dd MM yyyy').format(picked);
      horoscope.value = getHoroscope(selectedDate.value, 'horoscope');
      zodiac.value = getHoroscope(selectedDate.value, 'zodiac');
    } else {
      selectedDate.value = 'DD MM YYYY';
    }
  }

  getHoroscope(dob, type) {
    var splittedDob = dob.contains(' ') ? dob.split(' ') : dob.split('.');
    final day = int.parse(splittedDob[0]);
    final month = int.parse(splittedDob[1]);
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return type == 'horoscope' ? 'Aquarius' : 'Water Beaver';
    } else if ((month == 2 && day >= 19) || (month == 03 && day <= 20)) {
      return type == 'horoscope' ? 'Pisces' : 'Fish';
    } else if ((month == 3 && day >= 21) || (month == 04 && day <= 19)) {
      return type == 'horoscope' ? 'Aries' : 'Ram';
    } else if ((month == 4 && day >= 20) || (month == 05 && day <= 20)) {
      return type == 'horoscope' ? 'Taurus' : 'Bull';
    } else if ((month == 5 && day >= 21) || (month == 06 && day <= 21)) {
      return type == 'horoscope' ? 'Gemini' : 'Twins';
    } else if ((month == 6 && day >= 22) || (month == 07 && day <= 22)) {
      return type == 'horoscope' ? 'Cancer' : 'Crab';
    } else if ((month == 7 && day >= 23) || (month == 08 && day <= 22)) {
      return type == 'horoscope' ? 'Leo' : 'Lion';
    } else if ((month == 8 && day >= 23) || (month == 09 && day <= 22)) {
      return type == 'horoscope' ? 'Virgo' : 'Virgin';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 23)) {
      return type == 'horoscope' ? 'Libra' : 'Balance';
    } else if ((month == 10 && day >= 24) || (month == 11 && day <= 21)) {
      return type == 'horoscope' ? 'Scorpio' : 'Scorpion';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return type == 'horoscope' ? 'Sagittarius' : 'Archer';
    } else if ((month == 12 && day >= 22) || (month == 01 && day <= 19)) {
      return type == 'horoscope' ? 'Capricornus' : 'Goat';
    }
  }
}
