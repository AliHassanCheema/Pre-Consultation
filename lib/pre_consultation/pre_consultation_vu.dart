import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pre_consultation_detail/pre_consultation_detail_vu.dart';
import 'pre_consultation_vm.dart';

class PreConsultationScreen
    extends ViewModelBuilderWidget<PreConsultationViewModel> {
  const PreConsultationScreen({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, PreConsultationViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('pre_consultation'),
          automaticallyImplyLeading: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://s3.us-east-2.amazonaws.com/pubshare.chi.com/orderables/image+placeholdeer.png',
                          height: 45,
                          width: 45,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Age',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Mobile Phone ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'GEnder',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'MR No.',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Nurse Notes',
                    style: TextStyle(
                        color: Color.fromARGB(255, 22, 97, 158), fontSize: 20),
                  )),
              const SizedBox(height: 10),
              TextField(
                controller: viewModel.controller,
                maxLines: 5,
                cursorColor: const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                // controller:
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0x38, 0x7b, 0x96, 1.0),
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Enter Note',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'External Medication',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    color: Colors.blue,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const PreConsultationDetailScreen();
                        })).then((value) {
                          if (value != null) {
                            viewModel.onAddExternalMedication(value);
                          }
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 65),
                  child: ListView.builder(
                      itemCount: viewModel.externalMedications.length,
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return viewModel.externalMedications.isEmpty
                            ? const Text('Null Data')
                            : medicationListCell(viewModel, index);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(0x38, 0x7b, 0x96, 1.0)),
              onPressed: () {
                viewModel.onSavePreConsultation(context);
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
  PreConsultationViewModel viewModelBuilder(BuildContext context) {
    PreConsultationViewModel vm = PreConsultationViewModel();
    vm.getUserProfile();
    return vm;
  }
}

Widget medicationListCell(PreConsultationViewModel viewModel, int index) {
  return Card(
    elevation: 2.0,
    color: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Row(
        children: [
          const SizedBox(width: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              'https://s3.us-east-2.amazonaws.com/pubshare.chi.com/orderables/image+placeholdeer.png',
              height: 45,
              width: 45,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.externalMedications[index].medicineName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                viewModel.externalMedications[index].frequency!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                viewModel.externalMedications[index].dosage.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
