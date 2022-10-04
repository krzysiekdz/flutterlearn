import 'package:flutter/material.dart';
import '../../../styles/Styles.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();

}

class _RegisterViewState extends State<RegisterView> {

  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  bool showPassword = false;
  bool showPassword2 = false;

  @override
  void initState() {
    super.initState();

    login.addListener(() { print('login is: ${login.text}'); });
    password.addListener(() { print('password is: ${password.text}'); });
    password2.addListener(() { print('password2 is: ${password2.text}'); });
  }

  @override
  void dispose() {
    login.dispose();
    password.dispose();
    password2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('pop scope');
        return Future<bool>.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Zakładanie konta w Zeszycik Pro'),
//          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },),
          ),
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
      ),
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

      const Text('Rejestracja', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),

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
        textInputAction: TextInputAction.next,
      ),

      gap(),
      TextFormField(
        controller: password2,
        decoration:  InputDecoration(labelText: 'Powtórz hasło', prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: (){ setState(() { showPassword2 = !showPassword2; }); },
                icon: Icon( showPassword2 ? Icons.visibility_off : Icons.visibility ))
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: !showPassword2,
        enableSuggestions: false,
        textInputAction: TextInputAction.done,
      ),


      gap(12),
      ElevatedButton(onPressed: (){}, child: const Text('Zarejestruj się'),),

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