import 'package:flutter/material.dart';

import '../../helper/const.dart';
import '../../widgets.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('chat page'),),
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
          AppContainer(
            padding:20,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index) {
                      return Column(
                      children: [
                      Row(
                      mainAxisAlignment:index%2==0?MainAxisAlignment.start: MainAxisAlignment.end,
                      children: [
                      AppContainer(
                      alignment:index%2==0?Alignment.topRight:Alignment.topLeft,
                      padding: 10,
                      radius: 5,
                      color: Colors.white,
                      child:Column(
                      crossAxisAlignment:index%2==0?CrossAxisAlignment.end:CrossAxisAlignment.start,
                      children: [
                      AppText(index%2==0?'السلام عليكم و رحمة الله و بركاته':'و عليكم السلام و رحمة الله و بركاته ',fontWeight: FontWeight.normal,
                      fontSize: 15),
                      const AppText('12:30 pm',fontSize: 10,color: Colors.black45,fontWeight: FontWeight.normal)
                          ],
                          ))
                          ],
                          ),
                      const AppSpacer()
                          ],
                          );
                    }
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: AppTextField(label: 'message', hint:'enter your message')),
                    IconButton(onPressed: (){}, icon:const Icon(Icons.send,color: main1Color,size:30,))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
