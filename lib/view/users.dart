import 'package:flutter/material.dart';

import '../../helper/const.dart';
import '../../widgets.dart';
import 'chat_page.dart';
class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key,required this.email}) : super(key: key);
final String email;
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}
class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title:const Column(
            children: [
              AppText('chat screen',fontSize: 15),
            ],
          ),),
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
              Container(
                padding: const EdgeInsets.all(10),
                height: double.infinity,
                child: ListView.builder(
                    itemCount:5,
                    itemBuilder: (context,index)=>const UserWidget()),
              ),
            ],
          )

        );
    //     },
    //   ),
    // );
  }


}
class UserWidget extends StatelessWidget {
  const UserWidget({Key? key,}) : super(key: key);
// final UserBloc model;
// final int index;
// final String userEmail;
  @override
  Widget build(BuildContext context) {

    AppHelper appHelper=AppHelper(context);
    return GestureDetector(
    onTap: (){

      appHelper.navigate(const ChatScreen());
    },
    child:const ChatWidget() ,
          );
  }
}
class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
              children: [
                Row(
                  children: [
                    AppContainer(
                        color:main1Color,
                        child:AppText('العباسية',color: Colors.white),width:70,height:70,radius: 50),
                    AppSpacer(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('بنك دم العباسية',fontSize: 15),
                          AppText('السلام عليكم',color: Colors.black45,fontWeight:FontWeight.normal,fontSize: 15)
                        ],
                      ),

                    ),
                    Column(
                      children: [
                        AppText('12:30 pm',fontSize: 10,fontWeight: FontWeight.normal),
                         Row(
                          children: [
                            Icon(Icons.notifications_off,color: Colors.grey,),
                            Visibility(
                              visible:true,
                              child:AppContainer(
                                color:main1Color,
                                  width:25,
                                  height: 25,
                                  radius: 20,
                                  child:AppText('2',fontSize: 15,color:Colors.white)),
                            )
                          ],
                        )
                      ],
                    ),

                  ],
                ),
                AppSpacer(height: 10,)
              ],
            );
  }
}

