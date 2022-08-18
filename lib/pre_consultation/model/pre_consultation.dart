
class PreConsultationList{
  String? patientId;
  String? appointmentId;
  List <ExternalMedications> externalMedications ;
  String? nurseNotes;
  PreConsultationList(this.patientId, this.appointmentId, this.externalMedications, this.nurseNotes);
  static PreConsultationList fromMap(Map<String, dynamic> resp) {
    List<ExternalMedications>? data;
    if (resp['data'] != null) {
      data = List<ExternalMedications>.from(
          resp['data'].map((item) => ExternalMedications.fromMap(item)));
    }
    return PreConsultationList(
        resp['patient_id'] as String? ,
        resp['appointment_id'] as String?,
        resp['external_medications'] = data as List<ExternalMedications>,
        resp['nurse_notes'] as String?
    );
  }
  // Map<String, dynamic> toMap(){
  //   return {
  //     'patientId' : patientId,
  //     'appointmentId' : appointmentId,
  //     'externalMedications'  : externalMedications,
  //     'nurseNotes' : nurseNotes,
  //   };
  // }


}

class ExternalMedications {
  String? medicineName;
  String? medicineId;
  String? frequency;
  int? dosage;
  int? forLast;
  String? durationUnit;
  int? endDate;


  ExternalMedications(
      this.medicineName,
      this.medicineId,
      this.frequency,
      this.dosage,
      this.forLast,
      this.durationUnit,this.endDate
      );

  static ExternalMedications fromMap(Map<String, dynamic> resp) {
    return ExternalMedications(
      resp['medicine_name'] as String?,
      resp['medicine_id'] as String?,
      resp['frequency'] as String?,
      resp['dosage'] as int?,
      resp['for_last'] as int?,
      resp['duration_unit'] as String?,
      resp['end_date'] as int?,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'medicine_name' : medicineName,
      'medicine_id' : medicineId,
      'frequency'  : frequency,
      'dosage' : dosage,
      'for_last' : forLast,
      'duration_unit': durationUnit,
      'end_date': endDate,
    };
  }

}
