import 'package:flutter/material.dart';

import '../../widgets.dart';
import '../model/place_model.dart';
class ReservationScreen  extends StatefulWidget {
   const ReservationScreen({Key? key,required this.placeModel}) : super(key: key);
  final PlaceModel placeModel;

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  bool isReserved=false;
  bool isConfirmed=false;
  String reserve='احجز';
  int click=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: AppText(widget.placeModel.placeName),) ,
      body: AppContainer(
          padding: 10,
          child: Column(
            children: [
              //LogoWidget(placeName: placeModel.placeName,),
              //AppSpacer(height: 50,),
             Expanded(
               flex: 1,
               child: Card(
                 child:Column(
                   children:[
                     Row(children:[ Expanded(child: AppText(widget.placeModel.placeAddress)),
                       //AppSpacer(width: 10,),
                       const Icon(Icons.location_on)
                     ]),
                     const AppSpacer(),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         AppText(widget.placeModel.placeStatus)
                       ],
                     ),
                   ]
                 )
               ),
             ),
              const Expanded(
                flex: 2,
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: AppText('تعليمات بخصوص صرف الدم من البنك \n يجب احضار عينة الدم و طلب نقل الدم من المستشفى'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isReserved,
                child: const AppContainer(
                  height: 100,
                  color: Colors.red,
                  child: AppText('في انتظار الرد من البنك لتأكيد حجز الكيس'),
                ),
              ),
              Visibility(
                visible: isConfirmed,
                child: const AppContainer(
                  height: 100,
                  color: Colors.green,
                  child: Row(
                    children: [
                      Expanded(child: AppText('تم حجز الكيس برقم 103 يمكنك متابعة الحجز من خلال البحث بهذا الرقم')),
                    ],
                  ),
                ),
              ),
              AppButton(data:reserve,
              onTap: (){
                if(click==0) {
                  setState(() {
                    isReserved = true;
                    reserve = 'ف انتظار التأكيد';
                  });
                  click=1;
                }
                else
                {
                  setState(() {
                    isReserved = false;
                    isConfirmed=true;
                    reserve = 'تم الحجز';
                  });
                }
              },
              )
            ],
          ),
        ),
    );
  }
}
