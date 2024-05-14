import 'package:flutter/material.dart';
import 'users.dart';
import '../../helper/const.dart';
import '../../widgets.dart';
import '../model/patient_model.dart';
class MainBloodBankScreen extends StatelessWidget {
  const MainBloodBankScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> bloodBankScreens=[const BloodBankStockScreen(),const BloodRequestScreen(reserved: false,),const BloodRequestScreen(reserved:true,)];
    return DefaultTabController(
      length:bloodBankScreens.length ,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const AppText('بنك دم العباسية'),
        bottom: const TabBar(tabs: [
          Tab(text:'الرصيد',),
          Tab(text: 'الطلبات الواردة',),
          Tab(text: 'الطلبات المحجوزة',),

        ]),
          actions: [
            IconButton(icon:const Icon(Icons.chat,color: main1Color,),
              onPressed: (){
                AppHelper(context).navigate(UsersScreen(email: ''));

                // showDialog(context: context, builder:(c){
                //   //return AlertDialog(content: HospitalSearchWidget(),);
                // });
              },),
          ],
        ),
        body:
        TabBarView(children: [
          bloodBankScreens[0],
          bloodBankScreens[1],
          bloodBankScreens[2]
        ])
        // AppContainer(
        //   child: Column(
        //     children: [
        //
        //
        //       AppSpacer(),
        //       AppButton(data: 'الطلبات المحجوزة',backGroundColor: Colors.teal),
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
class BloodBankStockScreen extends StatefulWidget {
  const BloodBankStockScreen({Key? key}) : super(key: key);
  @override
  State<BloodBankStockScreen> createState() => _BloodBankStockScreenState();
}
class _BloodBankStockScreenState extends State<BloodBankStockScreen> {
  int initialPageIndex=0;
  @override
  Widget build(BuildContext context) {
    PageController pageController=PageController(initialPage: initialPageIndex);
    return AppContainer(
      padding: 10,
      child:Column(
        children: [
          //Expanded(child: TestWidget()),
          const AppSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText('الرصيد'),
              const Expanded(child: AppSpacer()),
              IconButton(onPressed: () {
                setState(() {
                  initialPageIndex>5?initialPageIndex--:initialPageIndex++;
                  pageController=PageController(initialPage: initialPageIndex);
                });
              },
              icon: const Icon(Icons.arrow_forward,color: main1Color,))
            ],
          ),
          Expanded(child:PageView(
            controller:pageController,
            scrollDirection: Axis.horizontal,
            children: [
              const BloodStockWidget(type: 'blood',),
              const BloodStockWidget(type: 'FFP',count: 4,),
              const BloodStockWidget(type: 'FP',count: 4,),
              const BloodStockWidget(type: 'CSP',count: 4,),
              const BloodStockWidget(type: 'CRYO',count: 4,),
              //PlasmaStockWidget(),
              const BloodStockWidget(type: 'platelets',),
            ],
          )),
          AppButton(
            onTap: (){

              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder:(context){
                return const AddToStockWidget();
              });

            },
            data: 'اضف الى الرصيد',backGroundColor:main1Color,),
        ],
      ),
    );
  }
}
class BloodStockWidget extends StatelessWidget {
  const BloodStockWidget({Key? key,required this.type,this.count=8}) : super(key: key);
  final String type;
  final int count;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(type),
              // Expanded(child: AppSpacer()),
              // Icon(Icons.arrow_forward,color: main1Color,)
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount:count,
                itemBuilder: (context,index){
              return const Card(
                elevation: 10,
                child: AppContainer(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      AppText('A'),
                      AppSpacer(width: 10,),
                      AppText('20'),
                      Expanded(child: AppSpacer()),
                      Icon(Icons.add,color: main1Color,),
                      AppSpacer(width: 10,),
                      Icon(Icons.minimize,color: main1Color,)
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class AddToStockWidget extends StatelessWidget {
  const AddToStockWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> bloodGroups=['A+','A-','B+','B-','AB+','AB-','O+','O-'];
    List<String> bloodComponents=['PRBCs','FFP','FP','CRYO','CSP','PLATELET',];
    return Padding(
      padding:MediaQuery.of(context).viewInsets,
      child: AppContainer(
        color: Colors.white,
        radius: 20,
        height: 400,
        child: Column(
          children:
              [
               // AppSpacer(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                    const AppText('blood Group',fontSize: 15,),
                    const AppSpacer(width: 30,),
                    DropdownButton<String>(
                        value: bloodGroups[0],
                        items:
                        bloodGroups.map((e) =>
                            DropdownMenuItem<String>(
                                value: e,
                                child: AppText(e))).toList()
                        , onChanged:(value){})
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // AppTextField(label:'فصيلة الدم', hint:'ادخل فصيلة الدم'),
                    const AppText('blood component',fontSize: 12,),
                    const AppSpacer(width: 10,),
                    DropdownButton<String>(
                        value: bloodComponents[0],
                        items:
                        bloodComponents.map((e) =>
                            DropdownMenuItem<String>(
                                value: e,
                                child: AppText(e))).toList()
                        , onChanged:(value){})
                  ],
                ),
                const Row(children: [
                Expanded(child: AppTextField(label: 'number', hint:'enter number',textInputType: TextInputType.number)),
                            ],
                          ),
            const Expanded(
                child: AppSpacer()),
            AppButton(
                onTap: (){
                  Navigator.pop(context);
                },
                data: 'add')
          ],
        ),
      ),
    );
  }
}
class BloodRequestScreen extends StatelessWidget {
  const BloodRequestScreen({Key? key,required this.reserved}) : super(key: key);
  final bool reserved;
  @override
  Widget build(BuildContext context) {
    PatientModel patientModel1=PatientModel(
        patientName:'فرحات دردير الدسوقي',
        bloodGroup:'A+',
        requiredBloodComponent:'PRBCs',
        requiredBloodComponentNumber:2,
        hospital:' عين شمس',
        diagnosis:'نزيف');
    PatientModel patientModel2=PatientModel(
        patientName:'احمد محمد عبد السميع',
        bloodGroup:'O+',
        requiredBloodComponent:'FFP',
        requiredBloodComponentNumber:4,
        hospital:' صدر العباسية',
        diagnosis:'نزيف');
    PatientModel patientModel3=PatientModel(
        patientName:'فاتن ابراهيم النجار',
        bloodGroup:'AB+',
        requiredBloodComponent:'PRBCs',
        requiredBloodComponentNumber:2,
        hospital:'الزهراء التخصصي',
        diagnosis:'ولادة قيصرية');
    List<PatientModel> patients=[patientModel1,patientModel2,patientModel3];
    return AppContainer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (con,index){
                return BloodRequestWidget(patientModel: patients[index],
                  color: patients[index].requiredBloodComponent=='PRBCs'?
                  Colors.red:Colors.yellow,reserved:reserved,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
class BloodRequestWidget extends StatelessWidget {
  const BloodRequestWidget({Key? key,required this.patientModel,required this.color,
  required this.reserved}) : super(key: key);
  final PatientModel patientModel;
  final Color color;
  final bool reserved;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: AppContainer(
        color:Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppContainer(
                  width: 100,
                  height: 100,
                  radius: 50,
                  color:color,
                  child:AppText(patientModel.bloodGroup,fontSize:50,color: Colors.white,) ,
                ),
                const AppSpacer(width: 50,),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppSpacer(width:70,),
                        AppText(':الاسم'),
                      ],
                    ),
                    AppText(patientModel.patientName,color:main3Color,),
                    const Row(
                      children: [
                        AppSpacer(width:70,),
                        AppText(':المطلوب'),
                      ],
                    ),
                    AppText('${patientModel.requiredBloodComponentNumber} ${patientModel.requiredBloodComponent}'
                    ,color:main3Color),
                    const Row(
                      children: [
                        AppSpacer(width:70,),
                        AppText(':مستشفى'),
                      ],
                    ),
                    AppText(patientModel.hospital,
                    color:main3Color,),
                    const Row(
                      children: [
                        AppSpacer(width:70,),
                        AppText(':التشخيص'),
                      ],
                    ),
                    AppText(patientModel.diagnosis,
                        color:main3Color)
                  ],
                )
              ],
            ),
            const AppSpacer(),
            reserved?
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText('5:00 pm',color: main1Color,),
                AppSpacer(width: 10,),
                AppText('محجوز حتى',color: main1Color,),

              ],
            )
                :Container(
              padding: const EdgeInsets.all(10),
                  child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                  Expanded(child: AppButton(data: 'رفض'),),
                  Expanded(child: AppSpacer()),
                  Expanded(child: AppButton(data: 'قبول',backGroundColor: main2Color,),)
                                ],
                              ),
                ),
          ],
        ),
      ),
    );
  }
}
