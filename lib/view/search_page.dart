import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'reservation_page.dart';
import '../../helper/const.dart';
import '../../widgets.dart';
import '../model/place_model.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
 double hight=400;
 @override
  void initState() {
    _controller=AnimationController(vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PlaceModel arbtc=PlaceModel(placeName:'بنك دم العباسية',
        placePhone: '02345678',
        placeAddress: 'شارع السكة البيضاء امام الجوازات العباسية',
        placeStatus: 'مفتوح 24 ساعة');
    PlaceModel nbtc=PlaceModel(placeName: 'بنك دم الدقي',
        placePhone: '02345678',
        placeAddress: 'شارع وزارة الزراعة الدقي',
        placeStatus: 'مفتوح 24 ساعة');
    PlaceModel drbtc=PlaceModel(placeName: 'بنك دم دار السلام',
        placePhone: '02345678',
        placeAddress:'كورنيش النيل المعادي',
        placeStatus: 'مفتوح 24 ساعة');
    List<PlaceModel> places=[arbtc,nbtc,drbtc,arbtc,nbtc,drbtc];
    return Scaffold(
      appBar: AppBar(title: const AppText('الاماكن المتاحة'),
      ),
      body: AppContainer(
        child: Column(
          children: [
            Expanded(
              child: FlutterMap(options:const MapOptions(
                initialCenter: LatLng(30.033333,31.233334),
                initialZoom: 13.0
              ), children:[
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                ),
                //AppText('place in map')
              ]),
            ),
          ],
        ),
      ),
    bottomSheet: BottomSheet(
      onClosing: () {  },
      builder:(context)=> DraggableScrollableSheet(
        expand: false,
        builder:(context,scroll) {
          return AppContainer(
          child:
           ListView.builder(
            controller: scroll,
              itemCount:places.length,
              itemBuilder: (cont,index){
                return GestureDetector(
                  onTap: (){
                    AppHelper(cont).navigate(ReservationScreen(placeModel: places[index]));
                  },
                  child: PlaceWidget(placeModel: places[index]),
                );
              }),
        );
        },
      ),
    ),
    );
  }
  _showBottomSheet()
  {
    PlaceModel arbtc=PlaceModel(placeName:'بنك دم العباسية',
        placePhone: '02345678',
        placeAddress: 'شارع السكة البيضاء امام الجوازات العباسية',
        placeStatus: 'مفتوح 24 ساعة');
    PlaceModel nbtc=PlaceModel(placeName: 'بنك دم الدقي',
        placePhone: '02345678',
        placeAddress: 'شارع وزارة الزراعة الدقي',
        placeStatus: 'مفتوح 24 ساعة');
    PlaceModel drbtc=PlaceModel(placeName: 'بنك دم دار السلام',
        placePhone: '02345678',
        placeAddress:'كورنيش النيل المعادي',
        placeStatus: 'مفتوح 24 ساعة');
    List<PlaceModel> places=[arbtc,nbtc,drbtc,arbtc,nbtc,drbtc];
    showModalBottomSheet(
        enableDrag:false,
        context: context, builder: (cont){
      return
        Expanded(
          child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (cont,index){
                return GestureDetector(
                  onTap: (){
                    AppHelper(cont).navigate(ReservationScreen(placeModel: places[index]));
                  },
                  child: PlaceWidget(placeModel: places[index]),
                );
              }),
        );

    });
  }
}
class PlaceWidget extends StatelessWidget {
  const PlaceWidget({Key? key,required this.placeModel}) : super(key: key);
final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: AppContainer(
        child: Row(
          children: [
            AppContainer(
              width: 100,
              height: 100,
              radius: 50,
              color:main1Color,
              child:AppText(placeModel.placeName.substring(6),color: Colors.white,) ,
            ),
            //AppSpacer(width: 50,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(placeModel.placeName),
                  AppText(placeModel.placePhone,fontWeight: FontWeight.normal,),
                  AppText(placeModel.placeAddress,color:Colors.black45,fontWeight: FontWeight.normal,fontSize:15,),
                  AppText(placeModel.placeStatus,color: Colors.black45,fontWeight: FontWeight.normal,fontSize:15,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


