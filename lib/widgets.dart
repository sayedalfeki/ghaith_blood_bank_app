import 'package:flutter/material.dart';
import '../helper/const.dart';
class AppText      extends StatelessWidget {

  const AppText(this.data,{super.key, this.color=main2Color,
    this.textDecoration=TextDecoration.none,
    this.fontWeight=FontWeight.bold,this.fontSize=20});
  final String data;
  final Color color;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(
          fontFamily: 'Roboto',
        fontWeight:fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration,
        decorationColor: Colors.blue,
        decorationThickness: 2
    )
    );
  }

}
class AppContainer extends StatelessWidget {
  const AppContainer({ Key? key, this.child,
    this.width,
    this.height,
    this.color,
    this.radius=1,
    this.padding=1,
    this.alignment=Alignment.center,
    this.borderColor=Colors.white
  }) : super(key: key);
  final Widget? child;
  final Alignment alignment;
  final double? width,height;
  final double padding,radius;
  final Color? color;
      final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment:alignment,
        padding:  EdgeInsets.all(padding),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            border:Border.all(width: 1,color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(radius))
        ),
        child:child
    );
  }
}
class AppTextField extends StatelessWidget {
  const AppTextField({Key? key, this.controller,
    required this.label,
    required this.hint,
    this.radius=10,  this.borderColor=Colors.teal, this.filledColor,
    this.icon,  this.isPassword=false, this.showPassword=false,
    this.filled, this.onShowPassword,this.isFocused=false,
    this.onTap, this.onChanged, this.onValidate, this.floatingLabelBehavior
  ,this.textInputType=TextInputType.text,this.number=1}) : super(key: key);
  final TextEditingController? controller;
  final String label,hint;
  final double radius;
  final Color borderColor;
  final Color? filledColor;
  final IconData? icon;
  final bool isPassword,showPassword,isFocused;
  final bool? filled;
  final void Function()? onShowPassword;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType textInputType;
  final int? number;
  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        maxLines: number,
        validator: onValidate,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
            fillColor:filledColor,
            filled:filled,
            suffixIcon: showPassword?IconButton(onPressed:onShowPassword,
                icon: Icon(icon)) :Icon(icon),
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color:borderColor )),
            labelText: label,
            hintText: hint,
            floatingLabelBehavior: floatingLabelBehavior
        ),
        obscureText: isPassword,
        autofocus: isFocused,
        keyboardType:textInputType ,
      );
  }
}
class AppSpacer    extends StatelessWidget {
  const AppSpacer({Key? key, this.width=double.infinity, this.height=10}) : super(key: key);
  final double width,height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
class AppButton    extends StatelessWidget {
  const AppButton({Key? key, required this.data,
    this.backGroundColor=main1Color, this.textColor=Colors.white,  this.onTap,
    this.onDoubleTap,  this.onLongPress,this.height=50}) : super(key: key);
  final String data;
  final double height;
  final Color backGroundColor,textColor;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()?onLongPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: AppContainer(
          width:300 ,
          height:height,
          color: backGroundColor,
          radius: 10,
          child: AppText(data,color: textColor,fontSize:25,)
      ),
    );
  }
}
class AppHelper{
  final BuildContext context;
  AppHelper(this.context);
  printData(String data)
  {
    print(data);
  }
  showSnackBar(String data)
  {
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: AppText(data,color: Colors.white),backgroundColor: Colors.cyan,));
  }
  navigate(Widget route,{bool forget=false})
  {

    forget?Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>route)):Navigator.push(context,MaterialPageRoute(builder: (context)=>route));
  }
  Future<DateTime?>? showDate()async
  {
    DateTime? date=await  showDatePicker(
        currentDate: DateTime.now(), context: context,
        firstDate:DateTime(2020), lastDate:DateTime(2030));
    return date;
  }
  Future<TimeOfDay?>? showTime()async
  {
    TimeOfDay? time=await showTimePicker(
        context: context,initialTime: TimeOfDay.now() );
    return time;
  }
  static bool searchList(int item,List yearsList)
  {
    bool found=false;
    for (int i=0;i<yearsList.length;i++)
    {
      if(yearsList[i]==item)
        found=true;
    }
    return found;
  }
}


