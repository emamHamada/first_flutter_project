import 'package:flutter/material.dart';

myButton({
  required Widget label,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[300]),
        height: 50,
        child: label),
  );
}

//my divider

Widget myDivider = Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Divider(
      thickness: 1,
      color: Colors.blueGrey[900],
    ));

myCustomTextFormField(
    {required String label,
    required String? hint,
    void Function(String?)? onSaved,
    String? Function(String?)? validator}) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
      ),
      onSaved: onSaved,
      validator: validator,
    ),
  );
}

myCustomText({
  String text = '',
  double? size = 20,
  FontWeight? bolden = FontWeight.normal,
  Color? color = Colors.indigo,
  String? fontFamily = 'Lobster-Regular',
  FontStyle? style,
  AlignmentGeometry? align,
  EdgeInsetsGeometry? padding,
  double? width,
}) {
  return Container(
    alignment: align,
    padding: padding,
    child: Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: fontFamily,
          fontWeight: bolden,
          color: color,
          fontStyle: style),
    ),
  );
}
myCustomText0({
  String text = '',
  double? size = 20,
  FontWeight? bolden = FontWeight.normal,
  Color? color = Colors.indigo,
  String? fontFamily = 'Lobster-Regular',
  FontStyle? style,
  AlignmentGeometry? align,
  EdgeInsetsGeometry? padding,
  double? width,
}) {
  return Container(
    alignment: align,
    padding: padding,
    child: Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: fontFamily,
          fontWeight: bolden,
          color: color,
          fontStyle: style),
    ),
  );
}

//
// inputFieldForTasks({
//
//   required label,
//   required note,
//   controller,
//   widget, required initialValue,
//   // required initialValue,
// }) {
//   return Container(
//     margin: const EdgeInsets.only(top: 16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: titleStyle,
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 16),
//           margin: const EdgeInsets.only(top: 8),
//           width: SizeConfig.screenWidth * .9,
//           height: 52,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: Colors.grey)),
//           child: TextFormField(
//             //initialValue: initialValue,
//             style: subtitleStyle,
//             autofocus: false,
//             cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
//             controller: controller,
//             readOnly: widget != null ? true : false,
//             decoration: InputDecoration(
//               hintText: note,
//               hintStyle: subtitleStyle,
//               enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.blueGrey,
//                     width: 0,
//                   )),
//               focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.blueGrey,
//                     width: 0,
//                   )),
//               suffixIcon: widget,
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'This Field Required';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
//
AlertDialog buildAlertDialog( user) {
  if (user != null) {
    // name = user.name;
    // phone = user.phone;
    // age = user.age;
    // flag = true;
  } else {
    // name = '';
    // phone = '';
    // age = '';
    // flag = false;
  }
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
          onPressed: () {
            // flag ? _editUser(user!) : _addUser();
            // flag ? 'Edit User' : '';
          },
          child: const Text('Save'))
    ],
    title: const Text('Add user'),
    content: SizedBox(
      width: 300,
      height: 150,
      child: Form(
       // key: _formkey,
        child: Column(
          children: [
            TextFormField(
              //initialValue: name,
              decoration: const InputDecoration(
                hintText: 'ADD Name',
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                fillColor: Colors.grey,
              ),
              onSaved: (String? value) {
               // name = value;
              },
            ),
            TextFormField(
              //initialValue: age,
              decoration: const InputDecoration(
                hintText: 'ADD Age',
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                fillColor: Colors.grey,
              ),
              onSaved: (String? value) {
             //   age = value;
              },
            ),
            TextFormField(
             // initialValue: phone,
              decoration: const InputDecoration(
                hintText: 'ADD Phone',
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                fillColor: Colors.grey,
              ),
              onSaved: (String? value) {
               // phone = value;
              },
            ),
          ],
        ),
      ),
    ),
  );
}
