import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_control/presentation/Widgets/CustomShadow.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  OtpFormState createState() => OtpFormState();
}

class OtpFormState extends State<OtpForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) => buildOtpField(index)),
      ),
    );
  }

  Widget buildOtpField(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: CustomShadow.shadow,
      ),
      child: SizedBox(
        height: 64,
        width: 64,
        child: TextFormField(
          controller: _controllers[index],
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: Theme.of(context).textTheme.titleLarge,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }

  String getOtpCode() {
    String otpCode = '';
    for (var controller in _controllers) {
      otpCode += controller.text;
    }
    return otpCode;
  }
}
