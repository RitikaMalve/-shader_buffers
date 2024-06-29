// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:sky/homepage.dart';
// import 'package:sky/registerpage.dart';
// import 'package:sky/splashscreen.dart';

// import 'Databse/databasehelper.dart';
// import 'Databse/usermodel.dart';

// void main() => runApp(LoginFormApp());

// class LoginFormApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Login Form',
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   var animationLink = 'asstes/image/login.riv';
//   SMIInput<bool>? isCheking;
//   SMIInput<bool>? isHandsUp;
//   SMIInput<bool>? trigSuccess;
//   SMIInput<bool>? trigFail;
//   late StateMachineController? stateMachineController;

//   // void _handleLogin() async {
//   //   if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//   //     String email = _emailController.text;
//   //     String password = _passwordController.text;

//   //     UserModel? user = await DatabaseHelper.instance.getUser(email, password);

//   //     if (user != null) {
//   //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //         content: Text('Welcome',style: TextStyle(color: Colors.blueAccent),),
//   //       ));
//   //       Navigator.pushReplacement(
//   //         context,
//   //         MaterialPageRoute(builder: (context) => HomePage(user:user )),

//   //       );
//   //     } else {
//   //       // User does not exist or incorrect credentials, show an error message
//   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //         content: Text('Invalid email or password',style: TextStyle(color: Colors.blueAccent),),
//   //       ));
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   // backgroundColor: Color.fromARGB(255, 239, 214, 212),
//     //   appBar: AppBar(
//     //     title: Center(
//     //         child: Text(
//     //       'Rive  Animation ',
//     //       style: TextStyle(
//     //           fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
//     //     )),
//     //   ),
//     //   body: Center(
//     //     child: SingleChildScrollView(
//     //       child: Padding(
//     //         padding: EdgeInsets.all(8.0),
//     //         child: Form(
//     //           key: _formKey,
//     //           child: Column(
//     //             mainAxisAlignment: MainAxisAlignment.center,
//     //             children: <Widget>[
//     //               SizedBox(
//     //                 height: 350,
//     //                 width: 400,
//     //                 child: RiveAnimation.asset(
//     //                   animationLink,
//     //                   fit: BoxFit.fill,
//     //                   stateMachines: ['Login Machine'],
//     //                   onInit: (artBoard) {
//     //                     stateMachineController =
//     //                         StateMachineController.fromArtboard(
//     //                             artBoard, ' Login Machine');
//     //                     if (stateMachineController == null) return;
//     //                     artBoard.addController(stateMachineController!);
//     //                     isCheking =
//     //                         stateMachineController?.findInput('isCheking');
//     //                     isHandsUp =
//     //                         stateMachineController?.findInput("isHandsUp");
//     //                     trigSuccess =
//     //                         stateMachineController?.findInput("trigSuccess");
//     //                     trigFail =
//     //                         stateMachineController?.findInput("trigFail");
//     //                   },
//     //                 ),
//     //               ),
//     //               Container(
//     //                 width: 300,
//     //                 child: TextFormField(

//     //                   onChanged: (value){

//     //                     if(isHandsUp !=null){

//     //                          isHandsUp!.change(false);
//     //                     }

//     //                     if(isCheking ==null)return;{

//     //                          isCheking!.change(true);
//     //                     }

//     //                   },
//     //                   controller: _emailController,
//     //                   decoration: InputDecoration(
//     //                     labelText: 'Email',
//     //                     contentPadding:
//     //                         EdgeInsets.symmetric(vertical: 13, horizontal: 15),
//     //                     border: OutlineInputBorder(
//     //                       borderRadius: BorderRadius.circular(10.0),
//     //                     ),
//     //                     suffix: Icon(
//     //                       Icons.email,
//     //                       color: Colors.amber,
//     //                     ),
//     //                   ),
//     //                   keyboardType: TextInputType.emailAddress,

//     //                 ),
//     //               ),
//     //               SizedBox(height: 10),
//     //               Container(
//     //                 width: 300,
//     //                 child: TextFormField(
//     //                   controller: _passwordController,
//     //                   decoration: InputDecoration(
//     //                       contentPadding: EdgeInsets.symmetric(
//     //                           vertical: 13, horizontal: 15),
//     //                       labelText: 'Password',
//     //                       border: OutlineInputBorder(
//     //                         borderRadius: BorderRadius.circular(10.0),
//     //                       ),
//     //                       suffix: const Icon(
//     //                         Icons.password,
//     //                         color: Colors.amber,
//     //                       )),
//     //                   obscureText: true,
//     //                   obscuringCharacter: '*',
//     //                   validator: (value) {
//     //                     if (value == null || value.isEmpty) {
//     //                       return 'Please enter your password';
//     //                     }
//     //                     return null;
//     //                   },
//     //                 ),
//     //               ),
//     //               Container(
//     //                   padding: EdgeInsets.only(left: 170, bottom: 10),
//     //                   child: Text('Forget password?')),
//     //               Container(
//     //                 width: 200,
//     //                 height: 50,
//     //                 padding: EdgeInsets.only(bottom: 5),

//     //                 // padding: EdgeInsets.only(bottom: 10),
//     //                 child: ElevatedButton(
//     //                   onPressed: () {},
//     //                   child: Text('Login'),
//     //                 ),
//     //               ),
//     //               Container(
//     //                 child: Row(
//     //                   mainAxisAlignment: MainAxisAlignment.center,
//     //                   children: [
//     //                     Text(
//     //                       "Don't have an Account?",
//     //                       style: TextStyle(fontSize: 15),
//     //                     ),
//     //                     InkWell(
//     //                       onTap: () {
//     //                         Navigator.push(
//     //                             context,
//     //                             MaterialPageRoute(
//     //                                 builder: (context) => Register()));
//     //                       },
//     //                       child: Text(
//     //                         'Register',
//     //                         style: TextStyle(color: Colors.blue, fontSize: 15),
//     //                       ),
//     //                     )
//     //                   ],
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );

//     return Scaffold(
//       backgroundColor: const Color(0xffD6E2EA),
//       appBar: AppBar(
//         title: const Text(
//           'Login Page',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xff6C3428),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // if (artBoard != null)
//               SizedBox(
//                   height: 350,
//                   width: 400,
//                   child: RiveAnimation.asset(
//                     animationLink,
//                     fit: BoxFit.fill,
//                     stateMachines: ['Login Machine'],
//                     onInit: (artBoard) {
//                       stateMachineController =
//                           StateMachineController.fromArtboard(
//                               artBoard, 'Login Machine');
//                       if (stateMachineController == null) return;
//                       artBoard.addController(stateMachineController!);
//                       isCheking =
//                           stateMachineController?.findInput('isChecking');
//                       isHandsUp =
//                           stateMachineController?.findInput('isHandsUp');
//                       trigSuccess =
//                           stateMachineController?.findInput('trigSuccess');
//                       trigFail = stateMachineController?.findInput('trigFail');
//                     },
//                   )),
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xff413142),
//                   // color: Colors.grey.shade400,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 height: 320.0,
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           onChanged: (value) {
//                             if (isHandsUp != null) {
//                               isHandsUp!.change(false);
//                             }
//                             if (isCheking == null) return;
//                             isCheking!.change(true);
//                           },
//                           controller: _usernameController,
//                           decoration: const InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             filled: true,
//                             // fillColor: Colors.grey.withOpacity(0.5),
//                             fillColor: Color.fromRGBO(128, 128, 128, 0.5),
//                             labelText: 'Username',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                               // Border color when focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               // Border color when not focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your username';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 16.0),
//                         TextFormField(
//                           onChanged: (value) {
//                             if (isCheking != null) {
//                               isCheking!.change(false);
//                             }
//                             if (isHandsUp == null) return;
//                             isHandsUp!.change(true);
//                           },
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelStyle: TextStyle(color: Colors.white),
//                             filled: true,
//                             // fillColor: Colors.grey.withOpacity(0.5),
//                             fillColor: Color.fromRGBO(128, 128, 128, 0.5),
//                             labelText: 'Password',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white),
//                               // Border color when focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red),
//                               // Border color when not focused
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0)),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 40.0),
//                         Container(
//                           height: 50.0,
//                           width: 300.0,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25.0),
//                               border:
//                                   Border.all(color: Colors.blue, width: 2.0),
//                               color: Colors.blue),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // Perform login logic here
//                                 String username = _usernameController.text;
//                                 String password = _passwordController.text;
//                                 // Add your authentication logic here
//                                 print(
//                                     'Logging in: $username with password: $password');
//                                 isCheking!.change(false);
//                                 isHandsUp!.change(false);
//                                 trigFail!.change(false);
//                                 trigSuccess!.change(true);
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => HomeScreen()),
//                                 // );
//                               } else {
//                                 isCheking!.change(false);
//                                 isHandsUp!.change(false);
//                                 trigSuccess!.change(false);
//                                 trigFail!.change(true);
//                               }
//                             },
//                             child: Text('Login'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// custome scrool view
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               title: Text('Custom Scroll View Example'),
//               floating: true,
//               expandedHeight: 200.0,
//               flexibleSpace: FlexibleSpaceBar(
//                 // background: .amber,
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) => ListTile(
//                   title: Text('Item $index'),
//                 ),
//                 childCount: 50,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Gridview scrollView

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Grid in Container Example'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Container(
//             width: 400,
//             child: Container(
//               width: double.infinity, // Set container width
//               height: double.infinity, // Set container height
//               color: Colors.grey[200], // Set container background color
//               padding: EdgeInsets.all(16.0), // Add padding to the container
//               child: GridView.count(
//                 crossAxisCount: 2, // Number of columns in the grid
//                 children: List.generate(10, (index) {
//                   return Container(
//                     color: Colors.blueAccent,
//                     margin: EdgeInsets.all(8.0), // Add margin between grid items
//                     child: Center(
//                       child: Text(
//                         'Item $index',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Page view scroll
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('PageView Example'),
//         ),
//         body: PageView(
//           children: <Widget>[
//             Container(
//               color: Colors.blue,
//               child: Center(
//                 child: Text('Page 1', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             Container(
//               color: Colors.green,
//               child: Center(
//                 child: Text('Page 2', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             Container(
//               color: Colors.orange,
//               child: Center(
//                 child: Text('Page 3', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shader_buffers/shader_buffers.dart';
// import 'dart:ui';

// typedef Layers = ({LayerBuffer mainImage, List<LayerBuffer> buffers});

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
//   late Layers shader;
//   ValueNotifier<bool> operations = ValueNotifier<bool>(false);
//   ShaderController controller = ShaderController();
//   ValueNotifier<List<Uniform>> uniform = ValueNotifier([]);

//   @override
//   void initState() {
//     super.initState();
//     shader = shader1();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData.dark(useMaterial3: true),
//       theme: ThemeData(scaffoldBackgroundColor: Colors.black),
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               ShaderBuffers(
//                 key: UniqueKey(),
//                 controller: controller,
//                 // width: 250,
//                 // height: 300,
//                 mainImage: shader.mainImage,
//                 buffers: shader.buffers,
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     ...List.generate(uniform.value.length, (index) {
//                       return ValueListenableBuilder(
//                         valueListenable: uniform,
//                         builder: (_, v, __) {
//                           return Row(
//                             children: [
//                               /// Sliders to control the uniforms
//                               Expanded(
//                                 child: Slider(
//                                   value: v[index].value,
//                                   min: uniform.value[index].range.start,
//                                   max: uniform.value[index].range.end,
//                                   onChanged: (value) {
//                                     uniform.value[index].value = value;
//                                     uniform.value = uniform.value.toList();
//                                   },
//                                 ),
//                               ),

//                               /// Button to animate the uniform
//                               IconButton(
//                                 onPressed: () {
//                                   controller.animateUniform(
//                                     uniformName: uniform.value[index].name,
//                                     begin: uniform.value[index].range.start,
//                                     end: uniform.value[index].range.end,
//                                     onAnimationEnded: (ctrl, uniformValue) {
//                                       /// Just update sliders
//                                       uniform.value = uniform.value.toList();
//                                     },
//                                   );
//                                 },
//                                 icon: const Icon(Icons.animation),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }),
//                     Wrap(
//                       alignment: WrapAlignment.center,
//                       spacing: 4,
//                       runSpacing: 4,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader1();
//                             });
//                           },
//                           child: const Text('1'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader2();
//                             });
//                           },
//                           child: const Text('2'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader3();
//                             });
//                           },
//                           child: const Text('3'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader4();
//                             });
//                           },
//                           child: const Text('4'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader5();
//                             });
//                           },
//                           child: const Text('5'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader6();
//                             });
//                           },
//                           child: const Text('6'),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               shader = shader7();
//                             });
//                           },
//                           child: const Text('7'),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Wrap(
//                       alignment: WrapAlignment.center,
//                       spacing: 4,
//                       runSpacing: 4,
//                       children: [
//                         ElevatedButton(
//                           onPressed: controller.pause,
//                           child: const Text('pause'),
//                         ),
//                         ElevatedButton(
//                           onPressed: controller.play,
//                           child: const Text('play'),
//                         ),
//                         ElevatedButton(
//                           onPressed: controller.rewind,
//                           child: const Text('rewind'),
//                         ),
//                         StatefulBuilder(
//                           builder: (context, setState) {
//                             final s = controller.getState();
//                             return ElevatedButton(
//                               onPressed: () => setState(() {}),
//                               child: Text('state: ${s.name}\npress to refresh'),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Layers shader1() {
//     uniform.value = [];
//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/image/lg.jpg',
//       // floatUniforms: [1.0],
//     )..setChannels(
//         [
//           // IChannel(assetsTexturePath: 'assets/flutter.png'),
//           // IChannel(assetsTexturePath: 'assets/bricks.jpg'),
//           IChannel(child: const Widget1()),
//           IChannel(child: const Widget2()),
//         ],
//       );

//     /// add checks to see when the pointer is near the left edge
//     controller = ShaderController();
//     controller.addConditionalOperation(
//       (
//         layerBuffer: mainLayer,
//         param: Param(CommonUniform.iMouseXNormalized),
//         checkType: CheckOperator.minor,
//         checkValue: 0.2,
//         operation: (ctrl, result) {
//           if (result) {
//             ctrl
//               ..swapChannels(mainLayer, 0, 1)
//               ..pause()
//               ..rewind();
//           }
//         },
//       ),
//     );
//     return (mainImage: mainLayer, buffers: []);
//   }

//   Layers shader2() {
//     uniform.value = [
//       Uniform(
//         name: 'a',
//         range: const RangeValues(0, 10),
//         defaultValue: 1,
//         value: 1,
//       ),
//       Uniform(
//         name: 'b',
//         range: const RangeValues(0, 10),
//         defaultValue: 1,
//         value: 1,
//       ),
//       Uniform(
//         name: 'c',
//         range: const RangeValues(0, 10),
//         defaultValue: 1,
//         value: 1,
//       ),
//     ];

//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/water.frag',
//       uniforms: Uniforms(uniform.value),
//     )..setChannels(
//         [
//           IChannel(assetsTexturePath: 'assets/flutter.png'),
//           // IChannel(child: const Widget1()),
//         ],
//       );

//     return (mainImage: mainLayer, buffers: []);
//   }

//   Layers shader3() {
//     uniform.value = [];
//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/page_curl.frag',
//       // floatUniforms: [0.1],
//     );

//     // ignore: cascade_invocations
//     mainLayer.setChannels(
//       [
//         IChannel(assetsTexturePath: 'assets/flutter.png'),
//         IChannel(assetsTexturePath: 'assets/bricks.jpg'),
//         // IChannel(child: const Widget1()),
//         // IChannel(child: const Widget2()),
//       ],
//     );
//     return (mainImage: mainLayer, buffers: []);
//   }

//   Layers shader4() {
//     uniform.value = [
//       Uniform(
//         name: 'R',
//         range: const RangeValues(0, 1),
//         defaultValue: 0.9,
//         value: 0.9,
//       ),
//       Uniform(
//         name: 'G',
//         range: const RangeValues(0, 1),
//         defaultValue: 0.9,
//         value: 0.9,
//       ),
//       Uniform(
//         name: 'B',
//         range: const RangeValues(0, 1),
//         defaultValue: 0.2,
//         value: 0.2,
//       ),
//     ];

//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/test_isself_main.frag',
//     );

//     final bufferA = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/test_isself_buffer_a.frag',
//       uniforms: Uniforms(uniform.value),
//     );

//     mainLayer.setChannels([IChannel(buffer: bufferA)]);

//     /// add checks to see when R>0.5
//     controller = ShaderController();
//     controller.addConditionalOperation(
//       (
//         layerBuffer: bufferA,
//         param: Param(CommonUniform.customUniform, uniformId: 0),
//         checkType: CheckOperator.major,
//         checkValue: 0.5,
//         operation: (ctrl, result) {
//           // debugPrint('$result  ${bufferA.uniforms!.uniforms[0].value}');
//         },
//       ),
//     );

//     return (mainImage: mainLayer, buffers: [bufferA]);
//   }

//   Layers shader5() {
//     uniform.value = [];
//     final bufferA = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/shader1_bufferA.frag',
//     );

//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/shader1_main.frag',
//     );

//     bufferA.setChannels([IChannel(buffer: bufferA)]);
//     mainLayer.setChannels([IChannel(buffer: bufferA)]);
//     return (mainImage: mainLayer, buffers: [bufferA]);
//   }

//   Layers shader6() {
//     uniform.value = [];

//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/mouse2.frag',
//     );
//     return (mainImage: mainLayer, buffers: []);
//   }

//   Layers shader7() {
//     uniform.value = [];
//     final bufferA = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/shader2_bufferA.frag',
//     );

//     final mainLayer = LayerBuffer(
//       shaderAssetsName: 'assets/shaders/shader2_main.frag',
//     );

//     bufferA.setChannels([IChannel(buffer: bufferA)]);
//     mainLayer.setChannels([IChannel(buffer: bufferA)]);
//     return (mainImage: mainLayer, buffers: [bufferA]);
//   }
// }

// class Widget1 extends StatelessWidget {
//   const Widget1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.green[100],
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Icon(Icons.account_circle, size: 42),
//             const SizedBox(width: 16),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Widget 1',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Text(
//                   'shader_preset',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 print('Widget 1');
//               },
//               child: const Text('Widget 1'),
//             ),
//             const Icon(Icons.add_box_rounded, size: 42),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Widget2 extends StatelessWidget {
//   const Widget2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.yellow[100],
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Icon(Icons.ac_unit, color: Colors.red, size: 42),
//             const SizedBox(width: 16),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Widget 2',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Text(
//                   'shader_preset',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 print('Widget 2');
//               },
//               child: const Text('Widget 2'),
//             ),
//             const Spacer(),
//             const Icon(Icons.delete_forever, color: Colors.red, size: 42),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLiquidSwipe(),
    );
  }
}

class MyLiquidSwipe extends StatelessWidget {
  final pages = [
    Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'asstes/image/ironman.jpg', // Replace 'page1.jpg' with your image asset
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'asstes/image/spiderman.jpg', // Replace 'page2.jpg' with your image asset
        fit: BoxFit.cover,
      ),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'asstes/image/hulk.jpg', // Replace 'page3.jpg' with your image asset
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        fullTransitionValue: 500,
        enableLoop: true,
        positionSlideIcon: 0.8,
        slideIconWidget: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
