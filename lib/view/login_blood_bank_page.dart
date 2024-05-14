import 'package:flutter/material.dart';
import 'blood_bank_page.dart';
import '../../widgets.dart';
class LoginBloodBankScreen extends StatelessWidget {
  const LoginBloodBankScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppTextField(label: 'blood bank name', hint:'enter blood bank name'),
          const AppSpacer(),
          const AppTextField(label: 'password', hint:'enter password'),
          const AppSpacer(),
          AppButton(data: 'login',onTap: (){
            AppHelper(context).navigate(const MainBloodBankScreen());
          },)
        ],
      ),
    );
  }
}
