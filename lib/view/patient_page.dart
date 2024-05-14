import 'package:flutter/material.dart';
import 'search_page.dart';
import '../../helper/const.dart';
import '../../widgets.dart';
class PatientScreen extends StatelessWidget {
  const PatientScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups=['A+','A-','B+','B-','AB+','AB-','O+','O-'];
    List<String> bloodComponents=['PRBCs','FFP','FP','CRYO','CSP','PLATELET',];
    List<String> bloodProcess=['PRBCs','filtered','washed','irradiated','aliqouting',];
    List<String> humanType=['male','female'];
    return  AppContainer(
      padding:20,
        child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppText('search for blood group',fontWeight: FontWeight.normal),
                  AppSpacer(),
                  AppTextField(label:'اسم المريض', hint:'ادخل اسم المريض'),
                  AppSpacer(),
                  AppTextField(label:'رقم البطاقة', hint:'ادخل رقم البطاقة ',textInputType: TextInputType.number,),
                  AppSpacer(),
                  AppTextField(label:'السن', hint:'ادخل عمر المريض',textInputType: TextInputType.number),
                  AppSpacer(),
                  AppTextField(label:'التشخيص', hint:'ادخل التشخيص'),
                  AppSpacer(),
                  //type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                      Expanded(child: AppSpacer(width: 30,)),
                      Radio(
                          activeColor: main1Color,
                          value:1, groupValue:1, onChanged:(value){}),
                      AppText('male',fontSize:20,),
                      Expanded(child: AppSpacer(width: 30,)),
                      Radio(value:false, groupValue:1, onChanged:(value){}),
                      AppText('female',fontSize:20,),
                      Expanded(child: AppSpacer(width: 30,)),
                      // DropdownButton<String>(
                      //     value: humanType[0],
                      //     items:
                      //    humanType.map((e) =>
                      //         DropdownMenuItem<String>(
                      //             value: e,
                      //             child: AppText(e))).toList()
                      //     , onChanged:(value){}),
                      // AppSpacer(width: 10,),
                      // Expanded(child: AppTextField(label:'السن', hint:'ادخل عمر المريض')),
                    ],
                  ),
                  AppSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                      AppText('blood Group',fontSize:20,fontWeight: FontWeight.normal,),
                      Expanded(
                          flex: 1,
                          child: AppSpacer()),
                      Expanded(
                        flex: 2,
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          value: bloodGroups[0],
                            items:
                            bloodGroups.map((e) =>
                                DropdownMenuItem<String>(
                                    value: e,
                                    child: AppText(e))).toList()
                            , onChanged:(value){}),
                      )
                    ],
                  ),
                  AppSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                      AppText('blood component',fontSize:20,fontWeight: FontWeight.normal,),
                      AppSpacer(width: 10,),
                      Expanded(
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                            value: bloodComponents[0],
                            items:
                            bloodComponents.map((e) =>
                                DropdownMenuItem<String>(
                                    value: e,
                                    child: AppText(e))).toList()
                            , onChanged:(value){}),
                      ),

                    ],
                  ),
                 AppSpacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                      AppText('blood processing',fontSize:20,fontWeight: FontWeight.normal,),
                      AppSpacer(width:10,),
                      Expanded(

                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                            value: bloodProcess[0],
                            items:
                            bloodProcess.map((e) =>
                                DropdownMenuItem<String>(
                                    value: e,
                                    child: AppText(e))).toList()
                            , onChanged:(value){}),
                      ),

                    ],
                  ),
                 // AppTextField(label:'المشتق المطلوب', hint:'ادخل نوع المشتق المطلوب(دم او بلازما او صفائح)'),
                  AppSpacer(height:10,),
                  //AppTextField(label:'patient name', hint:'enter patient name'),
                  //AppSpacer(),
                  AppButton(data: 'search',onTap: (){
                    AppHelper(context).navigate(SearchScreen());
                  },),
                ],
              ),
            )
        
        ),
      );
  }
}
