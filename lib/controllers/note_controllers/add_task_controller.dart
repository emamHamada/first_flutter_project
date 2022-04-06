// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:tasks/controllers/note_controllers/task_controller.dart';
//
// import '../../ui/components_to_use/constants/constants.dart';
//
// class AddTaskController extends GetxController {
//   DateTime _selectedDateTime = DateTime.now();
//
//   DateTime get selectedDateTime => _selectedDateTime;
//   String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
//   String endTime = DateFormat('hh:mm a')
//       .format(DateTime.now().add(const Duration(minutes: 15)))
//       .toString();
//   int _selectedRemind = 5;
//
//   get selectedRemind => _selectedRemind;
//
//   get selectedRepeat => _selectedRepeat;
//   final List<int> _remindList = [5, 10, 15, 20];
//   String _selectedRepeat = 'None';
//   final List<String> _repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
//   Color _selectedColor = Colors.blue.shade700;
//
//   getDateFromUser(
//     BuildContext context,
//   ) async {
//     DateTime? _pickedDate = await showDatePicker(
//         context: context,
//         initialDate: _selectedDateTime,
//         firstDate: DateTime(2000),
//         lastDate: DateTime(3000));
//     if (_pickedDate != null) {
//       _selectedDateTime = _pickedDate;
//       update();
//     } else {
//       debugPrint("it's null or something wrong!");
//     }
//   }
//
//   getTimeFromUser({required bool isStartTime, required context}) async {
//     TimeOfDay? _pickedTime = await showTimePicker(
//       helpText: "ادخل الوقت لتحرير التذكير",
//       cancelText: "خروج",
//       confirmText: "تأكيد",
//       minuteLabelText: "دقائق",
//       hourLabelText: "ساعات",
//       errorInvalidText: "تاكد من ان الوقت الذي ادخلته صحيح",
//       context: context,
//       initialTime: isStartTime
//           ? TimeOfDay.fromDateTime(DateTime.now())
//           : TimeOfDay.fromDateTime(
//               DateTime.now().add(
//                 const Duration(minutes: 15),
//               ),
//             ),
//     );
//     String _formatedTime = _pickedTime!.format(context);
//     if (isStartTime) {
//       startTime = _formatedTime;
//       update();
//     } else if (!isStartTime) {
//       endTime = _formatedTime;
//       update();
//     } else {
//       debugPrint("it's null or something wrong!");
//     }
//   }
//
//   DropdownButton<int> buildDrawableItemsList() {
//     return DropdownButton(
//       borderRadius: BorderRadius.circular(15),
//       dropdownColor: Colors.blueGrey,
//       onChanged: (int? newValue) {
//         _selectedRemind = newValue!;
//         update();
//       },
//       icon: const Icon(
//         Icons.keyboard_arrow_down,
//         color: Colors.grey,
//         size: 26,
//       ),
//       underline: Container(
//         height: 0,
//       ),
//       elevation: 4,
//       items: _remindList
//           .map(
//             (valueReminded) => DropdownMenuItem(
//               value: valueReminded,
//               child: Text("$valueReminded", style: headingStyle),
//             ),
//           )
//           .toList(),
//     );
//   }
//
//   buildDrawableItemsList0() {
//     return DropdownButton(
//       borderRadius: BorderRadius.circular(15),
//       dropdownColor: Colors.blueGrey,
//       onChanged: (String? newValue) {
//         _selectedRepeat = newValue!;
//         update();
//       },
//       icon: const Icon(
//         Icons.keyboard_arrow_down,
//         color: Colors.grey,
//         size: 26,
//       ),
//       underline: Container(
//         height: 0,
//       ),
//       elevation: 4,
//       items: _repeatList
//           .map(
//             (valueRepeated) => DropdownMenuItem(
//               value: valueRepeated,
//               child: Text(valueRepeated, style: headingStyle),
//             ),
//           )
//           .toList(),
//     );
//   }
//
//   Column colorPalette() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextButton(
//           child: Text("Color", style: titleStyle),
//           onPressed: () async{
//            await show();
//             update();
//           },
//         ),
//         const SizedBox(height: 8),
//         Wrap(
//           children: List<Widget>.generate(
//             3,
//             (index) => Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   //_selectedColor = index;
//                   update();
//                 },
//                 child: CircleAvatar(
//                   radius: 15,
//                   child: _selectedColor == index
//                       ? const Icon(
//                           Icons.done,
//                           color: Colors.white,
//                         )
//                       : null,
//                   backgroundColor: index == 0
//                       ? primaryClr
//                       : index == 1
//                           ? pinkClr
//                           : orangeClr,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//
// }
