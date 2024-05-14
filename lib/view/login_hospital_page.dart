import 'package:flutter/material.dart';
import 'hospital_page.dart';
import '../../widgets.dart';
class LoginHospitalScreen extends StatelessWidget {
  const LoginHospitalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppTextField(label: 'hospital name', hint:'enter hospital name'),
          const AppSpacer(),
          const AppTextField(label: 'password', hint:'enter password'),
          const AppSpacer(),
          AppButton(
              onTap: (){
                AppHelper(context).navigate(const MainHospitalScreen());
              },
              data: 'login')
        ],
      ),
    );
  }
}