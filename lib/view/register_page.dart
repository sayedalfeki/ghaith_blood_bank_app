// import 'package:flutter/material.dart';
// import 'package:wedding_room/hegazi_project/views/user_page.dart';
// import '../../widgets.dart';
// class AuthScreen     extends StatelessWidget
// {
//   const AuthScreen({super.key});
//   @override
//   Widget build(BuildContext context)
//   {
//    // AppHelper appHelper=AppHelper(context);
//     //return
//       // BlocConsumer<AuthBloc,AuthState>(
//       // listener: (context,state){
//       //   if(state is SignUpSuccess)
//       //   {
//       //     appHelper.showSnackBar(state.message);
//       //     AuthBloc.instance(context).changeIsLogin();
//       //   }
//       //   if(state is SignUpFailure)
//       //   {
//       //     appHelper.showSnackBar(state.errorMessage);
//       //   }
//       //   if(state is SignInSuccess)
//       //   {
//       //     appHelper.showSnackBar(state.message);
//       //     //AuthBloc.instance(context).getUser();
//       //     appHelper.navigate(HallsScreen(cashOperation:cashOperation,));
//       //   }
//       //   if(state is SignInFailure)
//       //   {
//       //     appHelper.showSnackBar(state.errorMessage);
//       //   }
//       // },
//       // builder:(context,state) {
//       //   AuthBloc authBloc=AuthBloc.instance(context);
//         return Scaffold(
//           appBar: AppBar(title: const AppText(''),),
//           body: SafeArea(
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               width: double.infinity,
//               child: const AuthFormWidget(),
//               //padding: const EdgeInsets.all(20),
//             ),
//           ),
//         );
//   }
// }
// class AuthFormWidget extends StatelessWidget {
//   const AuthFormWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     //AuthBloc authBloc=BlocProvider.of<AuthBloc>(context);
//     //AuthBloc authBloc=AuthBloc.instance(context);
//
//     return Form(
//      // key:authBloc.isLogin?authBloc.loginFormKey:authBloc.registerFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const LogoWidget(placeName: '',),
//           AppSpacer(width: 20),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     //authBloc
//                     const AppSpacer(),
//                     AppText('create new  account'),
//                     const SizedBox(height: 10,),
//                     // user name
//                     Visibility(
//                       //visible:!authBloc.isLogin,
//                       child: AppTextField(
//                           //controller: authBloc.userNameController,
//                           icon: Icons.person,
//                           label:'user name',
//                           hint: 'enter user name',
//                           //onValidate:AppHelper.validateValue
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     // first name
//                     // Visibility(
//                     //   //visible:!authBloc.isLogin,
//                     //   child: AppTextField(
//                     //       //controller: authBloc.firstNameController,
//                     //       icon: Icons.person,
//                     //       label:'first name',
//                     //       hint: 'enter first name',
//                     //      // onValidate:AppHelper.validateValue
//                     //   ),
//                     // ),
//                     // AppSpacer(),
//                     // // last name
//                     // Visibility(
//                     //   //visible:!authBloc.isLogin,
//                     //   child: AppTextField(
//                     //       //controller: authBloc.lastNameController,
//                     //       icon: Icons.person,
//                     //       label:'last name',
//                     //       hint: 'enter last name',
//                     //      // onValidate:AppHelper.validateValue
//                     //   ),
//                     // ),
//                     // AppSpacer(),
//                     // address
//                     Visibility(
//                       //visible:!authBloc.isLogin,
//                       child: AppTextField(
//                           //controller: authBloc.addressController,
//                           icon: Icons.person,
//                           label:'address',
//                           hint: 'enter your address',
//                          // onValidate:AppHelper.validateValue
//                       ),
//                     ),
//                     AppSpacer(),
//                     // email
//                     AppTextField(
//                       //controller: authBloc.emailController,
//                       icon: Icons.email,
//                       label:'email',
//                       hint: 'example@email.com',
//                       //onValidate: AppHelper.validateEmail,
//                     ),
//                     const SizedBox(height: 10,
//                     ),
//                     // user type
//                     // Visibility(
//                     //   //visible:!authBloc.isLogin,
//                     //   child: AppTextField(
//                     //       //controller: authBloc.typeController,
//                     //       icon: Icons.person,
//                     //       label:'user type',
//                     //       hint: 'enter user type',
//                     //      // onValidate:AppHelper.validateValue
//                     //   ),
//                     // ),
//                     // AppSpacer(),
//                     AppTextField(
//                         //controller: authBloc.passwordController,
//                         label:'password',
//                         hint: 'enter password',
//                         isPassword:true,
//                         icon: true?Icons.lock:Icons.lock_open,
//                         showPassword: true,
//                         onShowPassword: ()
//                         {
//                           // setState(() {
//                           // isHidden=!isHidden;
//                           // });
//                         },
//                         //onValidate: AppHelper.validatePassword
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                             value:true, onChanged:(value)
//                         {
//                           //model.rememberMe();
//                         }),
//                         const Expanded(child: AppText('remember me ',fontSize: 15)),
//                         TextButton(onPressed: (){}, child:const AppText('Have a problem?',
//                             fontSize: 15,textDecoration: TextDecoration.underline)),
//                       ],
//                     ),
//                     AppSpacer(),
//                     // authBloc.state is SignUpLoading?CircularProgressIndicator():
//                     // authBloc.state is SignInLoading?CircularProgressIndicator(
//                     //   semanticsLabel: 'login',
//                     // ):
//                     AppButton(data:'Register',
//                         onTap: (){
//                       AppHelper(context).navigate(UserScreen());
//                         },
//                         // onTap: ()async
//                         // {
//                         //   if( authBloc.isLogin)
//                         //   {
//                         //     if(authBloc.loginFormKey.currentState!.validate())
//                         //     {
//                         //       authBloc.loginUser();
//                         //     }
//                         //     //appHelper.showSnackBar('login soooon.........');
//                         //   }
//                         //   else
//                         //   {
//                         //     if(authBloc.registerFormKey.currentState!.validate())
//                         //     {
//                         //       authBloc.registerUser();
//                         //     }
//                         //   }
//                         // }
//                         ),
//                     AppSpacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         AppText('Already have an account ?',fontSize: 12,fontWeight: FontWeight.normal,),
//                         TextButton(onPressed: (){
//                          // authBloc.changeIsLogin();
//                         }, child:AppText('Login',
//                             fontSize: 15,textDecoration: TextDecoration.underline)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// class LogoWidget extends StatelessWidget {
//   const LogoWidget({Key? key,this.imageData,required this.placeName}) : super(key: key);
//   final String? imageData;
//   final String placeName;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         AppContainer(
//           padding:10,
//           radius: 10,
//           width: double.infinity,
//           height: 200,
//           color: Colors.purple,
//           // child: Image.asset('assets/images/frame.png'),
//           //  child: WrapableContainer(
//           //    color: Colors.purple
//           //  ),
//         ),
//         Positioned(
//           bottom:1,
//           child: Stack(
//             alignment: Alignment.center,
//             children:[
//               // Transform.translate(
//               //   offset: Offset(0, 40),
//               //   child: WrapableContainer(
//               //       child: SizedBox(),
//               //       color: Colors.white,
//               //       width: 120,
//               //       height: 120,
//               //       radius: 10,
//               //       borderColor: Colors.white
//               //   ),
//               // ),
//               Transform.translate(
//                 offset: const Offset(0,40),
//                 child: AppContainer(
//                     borderColor: Colors.teal,
//                     width: 100,
//                     height: 100,
//                     radius: 50,
//                   child: AppText(placeName),
//                 ),
//               ),
//               // child:imageData!=null?
//               // profileImageWidget(imageData!):
//               // logoContainer()
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//   // logoContainer()
//   // {
//   //   return Container(
//   //     height: 100,
//   //     child:Image.asset('assets/images/intern.png'),
//   //   );
//   // }
//   profileImageWidget(String src)
//   {
//     return ClipOval(
//         clipBehavior: Clip.hardEdge,
//         child:Image.network(src,width: 110,height: 110,fit: BoxFit.cover,)) ;
//
//   }
// }