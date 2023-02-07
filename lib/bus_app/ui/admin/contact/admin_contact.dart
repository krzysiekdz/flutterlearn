library bus_admin_contact;

import 'package:flutterlearn/bus_app/bus_app.dart';


class AdminContactForm extends BaseFormApiWidget {
  final ScreenSize screenSize;
  final AdminState adminState;

  AdminContactForm({super.key, required this.screenSize, required this.adminState}) :
    super(editTitle: 'Edycja kontaktu',
      formApiArgs: FormApiArgs( type: FormType.edit, data: 12, refreshParent: (){}, adminState: adminState));

  @override
  State<StatefulWidget> createState() => _AdminContactFormState();
}

class _AdminContactFormState extends BaseFormApiWidgetState<AdminContactForm, Contact>  {

  final TextEditingController name1 = TextEditingController();
  final TextEditingController name2 = TextEditingController();
  final TextEditingController name3 = TextEditingController();

  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController address3 = TextEditingController();

  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  void initFormFields() {
    name1.addListener(() { item.name1 = name1.text; });
    name2.addListener(() { item.name2 = name2.text; });
    name3.addListener(() { item.name3 = name3.text; });

    address1.addListener(() { item.address1 = address1.text; });
    address2.addListener(() { item.address2 = address2.text; });
    address3.addListener(() { item.address3 = address3.text; });

    phone.addListener(() { item.phone = phone.text; });
    email.addListener(() { item.email = email.text; });
  }

  @override
  void disposeFormFields() {
    name1.dispose();
    name2.dispose();
    name3.dispose();

    address1.dispose();
    address2.dispose();
    address3.dispose();

    phone.dispose();
    email.dispose();
  }

  @override
  Contact createItem(Map<String, String> m) => Contact(data: m);

  @override
  AdminModuleService createService() => ContactService.fromContext(context);

  @override
  void initAddModel([Contact? obj]) {}

  @override
  void initEditModel(Contact obj) {
    item.id = obj.id;
    item.name1 = obj.name1;
    item.name2 = obj.name2;
    item.name3 = obj.name3;
    item.address1 = obj.address1;
    item.address2 = obj.address2;
    item.address3 = obj.address3;
    item.phone = obj.phone;
    item.email = obj.email;
  }

  @override
  void copyModelToFields() {
    name1.text = item.name1 ;
    name2.text = item.name2 ;
    name3.text = item.name3 ;

    address1.text = item.address1 ;
    address2.text = item.address2 ;
    address3.text = item.address3 ;

    phone.text = item.phone ;
    email.text = item.email ;
  }

  @override
  int get tabCount => 3;

  @override
  void exitForm() {}

  @override
  void afterSubmit(ObjResponse response) {
    super.afterSubmit(response);

    setLoading(false);
    if( response.isSuccess() ) {
      showInfoDialog(context, title: const Text('Zapisano pomyślnie'));
    }
  }

  @override
  List<Tab> createTabs() {
    return  [
      const Tab(child: Text('Firma'),),
      const Tab(child: Text('Adres'),),
      const Tab(child: Text('Kontakt'),),
    ];
  }

  @override
  List<Widget> buildForms() {
    return [
      wrapForm(buildForm1()),
      wrapForm(buildForm2()),
      wrapForm(buildForm3()),
    ];
  }


  Widget buildForm1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        gap(h:24),

        TextField(
          controller: name1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Tekst - linia pierwsza')
          ),
        ),
        gap(h:24),

        TextField(
          controller: name2,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Tekst - linia druga')
          ),
        ),
        gap(h:24),

        TextField(
          controller: name3,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              label: Text('Tekst - linia trzecia')
          ),
        ),
        gap(h:24),



      ],
    );
  }


  Widget buildForm2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        gap(h:24),

        TextField(
          controller: address1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Adres - linia pierwsza')
          ),
        ),
        gap(h:24),

        TextField(
          controller: address2,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Adres - linia druga')
          ),
        ),
        gap(h:24),

        TextField(
          controller: address3,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              label: Text('Adres - linia trzecia')
          ),
        ),
        gap(h:24),



      ],
    );
  }


  Widget buildForm3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        gap(h:24),

        TextField(
          controller: phone,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Telefon'),
              prefixIcon: Icon(Icons.phone),
              prefixText: '(+ 48) '
          ),
        ),
        gap(h:24),

        TextField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              label: Text('E-mail'),
              prefixIcon: Icon(Icons.email),
          ),
        ),
        gap(h:24),


      ],
    );
  }


}