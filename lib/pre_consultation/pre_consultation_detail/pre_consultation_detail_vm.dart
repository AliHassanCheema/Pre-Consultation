import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../model/pre_consultation.dart';
import 'model/pre_consultation_detatil.dart';

class PreConsultationDetailViewModel extends BaseViewModel {
  List<PreConsultationMedicine> medicine = [
    PreConsultationMedicine('Panadol CF', '20mg', '1223'),
    PreConsultationMedicine('Arinac', '20mg', '1223'),
    PreConsultationMedicine('Moven', '20mg', '1223')
  ];
  List<Frequency> frequencyList = [];
  String selectedId = '0';
  String selectedFrequency = '0';
  int? selectedStartDate = 0;
  int? selectedEndDate = 0;

  final formKey = GlobalKey<FormState>();
  List<String> durationPeriod = ['Days', 'Week', 'Month'];

  late BuildContext mContext;
  String? search = '';
  String? dosage;
  ExternalMedications externalMedication =
      ExternalMedications(null, null, null, null, null, null, null);

  onStartup(context) {
    frequencyList.add(Frequency('Once Daily'));
    frequencyList.add(Frequency('Twice Daily'));
    frequencyList.add(Frequency('Thrice Daily'));
    frequencyList.add(Frequency('Four Times Daily'));
    frequencyList.add(Frequency('Weekly'));
    frequencyList.add(Frequency('Monthly'));

    // onGetMedicine(context, isFirst: true);
  }

  onGetMedicine(BuildContext context, {bool isFirst = false}) async {}

  onMedicineChange(BuildContext context, PreConsultationMedicine value) {
    // if (value.id != '-1') {
    externalMedication.medicineName = value.medicineName;
    debugPrint(
        '++++++++++ selectedId +++++++++++ $selectedId    ${value.medicineName}');
    // }
  }

  onFrequencyChange(BuildContext context, Frequency value) {
    if (value.frequency != '-1') {
      externalMedication.frequency = value.frequency!;
      debugPrint('++++++++++ selectedFrequency +++++++++++ $selectedFrequency');
    }
  }

  onDurationUnitSave(BuildContext context, String value) {
    externalMedication.durationUnit = value;
    debugPrint(
        '++++++++++ selectedFrequency +++++++++++ ${externalMedication.forLast}');
    // }
  }

  onSaveDosage(value) {
    externalMedication.dosage = int.parse(value);
  }

  onSaveForTheLast(value) {
    externalMedication.forLast = int.parse(value);
  }

  onSaveData(BuildContext context) {
    formKey.currentState!.save();
    externalMedication.endDate = selectedEndDate == 0 ? null : selectedEndDate;
    Navigator.pop(context, externalMedication);
  }

// showAlert(String title,String message,int errorCode){
//   showErrorAlert(
//       mContext,
//       title: title,
//       message: message,
//       errorCode: errorCode,
//       onConfirmClick: (){
//         Navigator.pop(mContext);
//       });
// }

}

class FormModel {
  String? nameMedicine;
  String? frequency;
  String? dosage;
  String? startDate;
  String? endDate;
  FormModel(this.nameMedicine, this.frequency, this.dosage, this.startDate,
      this.endDate);
}
