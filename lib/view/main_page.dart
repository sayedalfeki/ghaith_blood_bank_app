import 'package:flutter/material.dart';
import 'patient_page.dart';
import '../../helper/const.dart';
import '../../widgets.dart';
//import '../model/place_model.dart';
import 'donor_page.dart';
import 'login_blood_bank_page.dart';
import 'login_hospital_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   //PlaceModel placeModel= PlaceModel(placeName: 'arbtc', placePhone:'123456', placeAddress: 'cairo ', placeStatus:'open 24 hours');
    List<Widget> mainPageWidgets=[const PatientScreen(),const DonorScreen(),
      const LoginHospitalScreen(),const LoginBloodBankScreen()];
    //AppHelper appHelper=AppHelper(context);
    return DefaultTabController(
      length:mainPageWidgets.length,
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // leading: DecorationImage(
          //   image: AssetImage('assets/images/ghaith_icon.jpg',
          //       )),
          // ),
          title:  Row(
            children: [
              Image.asset('assets/images/ic_ghaith.png'
                ,height:65,
                  //width: 50,
                ),
              const AppText('GHAITH APP',color: main2Color,),
            ],
          ),
        bottom: const TabBar(
          isScrollable: true,
            tabAlignment:TabAlignment.start,
            tabs: [
          Tab(text: 'patient',),
          Tab(text: 'donor',),
          Tab(text: 'hospital',),
          Tab(text: 'blood bank',),
              // Tab(text: 'donor',),
              // Tab(text: 'blood bank',),
          // Tab(text: 'hospital',),

        ]),
          actions: [
            IconButton(onPressed: (){
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder: (context){
                return const RequestNumberWidget();
              });

            }, icon: const Icon(Icons.search,color: main1Color,))
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.05,
                      image: AssetImage('assets/images/ghaith_icon.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            TabBarView(
             children: [
               mainPageWidgets[0],
               mainPageWidgets[1],
               mainPageWidgets[2],
               mainPageWidgets[3],
               // mainPageWidgets[4],
               // mainPageWidgets[5]
             ],
            ),
          ],
        ),
      ),
    );
  }
}
class RequestNumberWidget extends StatelessWidget {
  const RequestNumberWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:MediaQuery.of(context).viewInsets,
      child: const AppContainer(
        color: Colors.white,
        radius: 5,
        padding: 20,
        height:250,
        child: Column(
          children: [
            AppText('search by request number'),
            AppSpacer(),
            AppTextField(label: 'number', hint: 'enter request number'
            ,textInputType: TextInputType.number,),
            Expanded(child: AppSpacer()),
            AppButton(data: 'search')
          ],
        ),
      ),
    );
  }
}

