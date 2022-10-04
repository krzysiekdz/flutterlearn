import 'package:flutter/material.dart';
import '../../../core/types.dart';
import '../../../styles/Styles.dart';
import '../app.dart';
import 'LoginRouter.dart';

class LoginView extends StatefulWidget {

  final FunctionString goToView;
  final FunctionInt setAppView;

  const LoginView({Key? key, required this.goToView, required this.setAppView}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {

  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();

    login.addListener(() { print('login is: ${login.text}'); });
    password.addListener(() { print('password is: ${password.text}'); });
  }

  @override
  void dispose() {
    login.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
              builder: (context, constraints) {
                  if(constraints.maxWidth < 600) {
                    return buildOneColumnLayout(context);
                  }
                  else {
                    return buildTwoColumnLayout(context);
                  }
              }),
          )
        );
  }



  Widget gap([double h = 12]) {
    return SizedBox(height: h,);
  }

  Widget buildOneColumnLayout(BuildContext context) {

    List<Widget> items = buildLogoArea(context);
    items.addAll(buildLoginForm());

     return Container(
       padding: const EdgeInsets.only(left: 48, right: 48, top: 12, bottom: 12),
       child: Center(
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: items,
           ),
         ),
       ),
     );
  }

  Widget buildTwoColumnLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: SingleChildScrollView(
          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: buildLogoArea(context),))),
              Expanded(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: buildLoginForm(),))),
            ],
          ),
        ),
      ),
    );

  }

  List<Widget> buildLoginForm() {
    return <Widget>[

      const Text('Logowanie', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),

      gap(),
      TextField(
        controller: login,
        decoration: const InputDecoration(labelText: 'E-mail', prefixIcon: Icon(Icons.person)),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),

      gap(),
      TextFormField(
        controller: password,
        decoration:  InputDecoration(labelText: 'Hasło', prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: (){ setState(() { showPassword = !showPassword; }); },
                icon: Icon( showPassword ? Icons.visibility_off : Icons.visibility ))
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: !showPassword,
        enableSuggestions: false,
        textInputAction: TextInputAction.done,
      ),

      Row(
        children: [
          const Expanded(child:Text('')),
          TextButton(onPressed: (){ widget.setAppView(App.MAIN_VIEW); }, child: const Text('Zapomniałeś hasła?')),
        ],
      ),

      gap(12),
      ElevatedButton(onPressed: (){}, child: const Text('Zaloguj się'),),

      gap(),
      OutlinedButton(onPressed: (){ widget.goToView( LoginRouter.REGISTER_ROUTE ); }, child: const Text('Załóż darmowe konto')),

    ];
  }

  List<Widget> buildLogoArea(BuildContext context) {

     return <Widget> [

       const Text('Notatki, listy zadań i kalendarz w jednym miejscu!', textAlign: TextAlign.center,
         style: TextStyle(fontStyle: FontStyle.italic),),
       gap(48),

       Image.asset('images/organizer.png', width: 80, height: 80, color: Colors.white70),

       gap(),
       Text('Zeszycik Pro', style: Styles.header()),


       gap(24),

     ];
  }

}