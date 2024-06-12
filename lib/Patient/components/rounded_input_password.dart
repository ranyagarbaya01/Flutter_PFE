import 'package:flutter/material.dart';
import 'package:pharmacy_app/Patient/components/input_container.dart';


// class RoundedPasswordInput extends StatefulWidget {
//   const RoundedPasswordInput({
//     Key? key,

//     required this.hint,
//   }) : super(key: key);

//   final String hint;

//   @override
//   _RoundedPasswordInputState createState() => _RoundedPasswordInputState();
// }

// class _RoundedPasswordInputState extends State<RoundedPasswordInput> {

//   @override
//   Widget build(BuildContext context) {
//     return InputContainer(
//       child: TextField(
//         cursorColor: Colors.black,
//         obscureText: true,
//         decoration: InputDecoration(
//           icon: Icon(Icons.lock, color: Color.fromARGB(255, 22, 219, 101),),
//           hintText: widget.hint,
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }

class RoundedPasswordInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  late bool? isObsecure;
  TextInputType? keyboardType;
  String? errorMessage;
  final String? Function(String?)? validator; // Add this line

  RoundedPasswordInput({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isObsecure,
    this.keyboardType,
    this.errorMessage,
    this.validator, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: Colors.black,
        obscureText: isObsecure ?? false,
        validator: validator, // Add this line
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return errorMessage ?? 'Ce champ est obligatoire';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Color.fromARGB(255, 22, 219, 101),
            ),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}

//  hintStyle: GoogleFonts.nunito(
//             fontSize: 15.sp,
//             fontWeight: FontWeight.w700,
//             color: Colors.grey,
//           ),

