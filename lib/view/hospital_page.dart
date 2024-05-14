import 'package:flutter/material.dart';
import '../../helper/const.dart';
import 'users.dart';
import '../../widgets.dart';
class MainHospitalScreen extends StatelessWidget {
  const MainHospitalScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('hospital page'),
      actions: [
        IconButton(icon:const Icon(Icons.search,color: main1Color,),
        onPressed: (){
          showDialog(context: context, builder:(c){
            return const AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: HospitalSearchWidget(),);
          });
        },),
        IconButton(icon:const Icon(Icons.chat,color: main1Color,),
          onPressed: (){
          AppHelper(context).navigate(const UsersScreen(email: ''));
            // showDialog(context: context, builder:(c){
            //   return AlertDialog(
            //     contentPadding: EdgeInsets.zero,
            //     content: AddToStockWidget(),);
            // });
          },),
      ],
      ),
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.09,
                    image: AssetImage('assets/images/ghaith_icon.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            padding:const EdgeInsets.all(10),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  AppTextField(label: 'blood bank', hint:'enter blood bank'),
                  AppSpacer(),
                  AppText('blood',fontWeight: FontWeight.normal,),
                  AppSpacer(),
                  Row(
                    children: [
                      AppText('A+',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width: 10,),
                      AppText('A-',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),

                    ],
                  ),
                  AppSpacer(),
                  Row(
                    children: [
                      AppText('B+',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width: 10,),
                      AppText('B-',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),

                    ],
                  ),
                  AppSpacer(),
                  Row(
                    children: [
                      AppText('O+',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width: 10,),
                      AppText('O-',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),

                    ],
                  ),
                  AppSpacer(),
                  Row(
                    children: [
                      AppText('AB+',fontSize: 20,),
                      AppSpacer(width:5,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width:5,),
                      AppText('AB-',fontSize: 20,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                    ],
                  ),
                  AppSpacer(height: 20,),
                  AppText('plasma',fontWeight: FontWeight.normal,),
                  AppSpacer(),
                  Row(
                    children: [
                      AppText('A',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width: 10,),
                      AppText('B',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                    ],
                  ),
                 AppSpacer(),
                  Row(
                    children: [
                      AppText('O',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                      AppSpacer(width: 10,),
                      AppText('AB',fontSize: 25,),
                      AppSpacer(width: 10,),
                      Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                    ],
                  ),
                  AppSpacer(),
                  AppTextField(label: 'notes', hint:'add notes ',number:3,),
                  AppSpacer(),
                  AppButton(data: 'order')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HospitalSearchWidget extends StatelessWidget {
  const HospitalSearchWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups=['A+','A-','B+','B-','AB+','AB-','O+','O-'];
    List<String> bloodComponents=['PRBCs','FFP','FP','CRYO','CSP','PLATELET',];
    List<String> bloodProcess=['PRBCs','filtered','washed','irradiated','aliqouting',];

    return AppContainer(
      color: Colors.white,
      radius: 20,
      padding:20,
      height: 350,
      child: Column(
        children:
        [
          const AppSpacer(height: 20,),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                const AppText('blood Group',fontSize: 15,),
                const Expanded(
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
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                const AppText('blood component',fontSize: 12,),
                const AppSpacer(width: 10,),
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
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                const AppText('blood processing',fontSize:12,),
                const AppSpacer(width:10,),
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
          ),
          const Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
              ],
            ),
          ),
          const Expanded(
              flex:2,
              child: AppSpacer()),
          AppButton(
              onTap: (){
                Navigator.pop(context);
              },
              data: 'search')
        ],
      ),
    );
  }
}

