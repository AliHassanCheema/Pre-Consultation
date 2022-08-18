import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'model/pre_consultation_detatil.dart';
import 'pre_consultation_detail_vm.dart';

class PreConsultationDetailScreen
    extends ViewModelBuilderWidget<PreConsultationDetailViewModel> {
  const PreConsultationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, PreConsultationDetailViewModel viewModel,
      Widget? child) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('external_medication'),
          automaticallyImplyLeading: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Theme(
                          data: ThemeData(
                            textTheme: const TextTheme(
                                subtitle1: TextStyle(color: Color(0xff387b96))),
                            inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(color: Color(0xff387b96)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: DropdownSearch<PreConsultationMedicine>(
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: 'Medication')),
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                                showSearchBox: true,
                                isFilterOnline: true,
                              ),
                              items: viewModel.medicine,
                              itemAsString: (PreConsultationMedicine? items) =>
                                  '${items!.medicineName!}    (${items.medicineStrength!})',
                              // selectedItem: viewModel.medicine[0],
                              onChanged: (PreConsultationMedicine? value) {
                                viewModel.onMedicineChange(
                                    context, value as PreConsultationMedicine);
                              },
                              asyncItems: (value) async {
                                viewModel.search = value;
                                debugPrint(
                                    '+++++++++++++++++++api calling for search item +++++++++${viewModel.search}');
                                await viewModel.onGetMedicine(context);
                                return viewModel.medicine;
                                // return  viewModel.onSearch(context,value);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Theme(
                          data: ThemeData(
                            textTheme: const TextTheme(
                                subtitle1: TextStyle(color: Color(0xff387b96))),
                            inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(color: Color(0xff387b96)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: DropdownSearch<Frequency>(
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: 'frequency')),
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                                showSearchBox: false,
                              ),
                              items: viewModel.frequencyList,
                              itemAsString: (Frequency? item) =>
                                  item!.frequency!,
                              // selectedItem: viewModel.frequencyList[0],
                              onChanged: (Frequency? value) {
                                viewModel.onFrequencyChange(
                                    context, value as Frequency);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: TextFormField(
                            maxLines: 1,
                            cursorColor:
                                const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 2.0,
                                ),
                              ),
                              hintText: 'Dosage',
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              viewModel.onSaveDosage(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: TextFormField(
                            maxLines: 1,
                            cursorColor:
                                const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 2.0,
                                ),
                              ),
                              hintText: 'For The Last',
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              viewModel.onSaveForTheLast(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Theme(
                          data: ThemeData(
                            textTheme: const TextTheme(
                                subtitle1: TextStyle(color: Color(0xff387b96))),
                            inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(color: Color(0xff387b96)),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: DropdownSearch<String>(
                              dropdownDecoratorProps:
                                  const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          hintText: 'Duration')),
                              popupProps: PopupProps.menu(
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                                showSearchBox: false,
                              ),
                              items: viewModel.durationPeriod,
                              itemAsString: (String? item) => item!,
                              // selectedItem: viewModel.frequencyList[0],
                              onChanged: (String? value) {
                                viewModel.onDurationUnitSave(
                                    context, value as String);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            _showEndDatePicker(context, viewModel);
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 6,
                            child: TextFormField(
                              cursorColor:
                                  const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                              enabled: false,
                              style: const TextStyle(color: Colors.grey),
                              controller:
                                  TextEditingController(text: 'End Date'),
                              decoration: InputDecoration(
                                hintText: 'End Date',
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                                    width: 1.0,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 20),
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 20, 10),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.grey.shade400,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0)),
              onPressed: () {
                viewModel.onSaveData(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('save'.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              )),
        ),
      ),
    );
  }

  @override
  PreConsultationDetailViewModel viewModelBuilder(BuildContext context) {
    PreConsultationDetailViewModel vm = PreConsultationDetailViewModel();
    vm.onStartup(context);
    return vm;
  }

  void _showEndDatePicker(ctx, PreConsultationDetailViewModel viewModel) async {
    var finalDate = 0;
    if (Platform.isIOS) {
      showCupertinoModalPopup(
          context: ctx,
          builder: (_) => Container(
                height: 400,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: DateTime.now(),
                          minimumYear: 1980,
                          maximumYear: 2100,
                          onDateTimeChanged: (val) {
                            finalDate = val.millisecondsSinceEpoch;
                          }),
                    ),
                    CupertinoButton(
                        child: Text('done'.toUpperCase()),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          if (finalDate != 0) {
                            viewModel.selectedEndDate = finalDate ~/ 1000;
                            viewModel.notifyListeners();
                          } else {
                            viewModel.selectedEndDate =
                                DateTime.now().millisecondsSinceEpoch ~/ 1000;
                            viewModel.notifyListeners();
                          }
                        })
                  ],
                ),
              ));
    } else {
      final DateTime? picked = await showDatePicker(
          context: ctx,
          firstDate: DateTime(1980),
          lastDate: DateTime(2100),
          initialDate: DateTime.now());
      if (picked != null && picked != DateTime.now()) {
        finalDate = picked.millisecondsSinceEpoch;
        viewModel.selectedEndDate = finalDate ~/ 1000;
        viewModel.notifyListeners();
      }
    }
  }
}
