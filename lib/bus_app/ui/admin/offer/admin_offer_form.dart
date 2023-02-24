part of bus_admin_offer;


class AdminOfferForm extends BaseFormApiWidget {
  AdminOfferForm({super.key, required super.formApiArgs}) :
    super(addTitle: 'Nowa oferta', editTitle: 'Edycja oferty');

  @override
  State<StatefulWidget> createState() => _AdminOfferFormState();
}

class _AdminOfferFormState extends BaseFormApiWidgetState<AdminOfferForm, Offer>  {

  @override
  Offer createItem(Map<String, String> m) => Offer(data: m);

  @override
  AdminModuleService createService() => OfferService.fromState(adminState);

  @override
  void initAddModel([Offer? obj]) {
    item.visible = true;
    item.order = 0;
  }

  @override
  void initEditModel(Offer obj) {
    item.title = obj.title;
    item.subtitle = obj.subtitle;
    item.descr = obj.descr;
    item.order = obj.order;
    item.visible = obj.visible;
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController subtitle = TextEditingController();
  final TextEditingController descr = TextEditingController();
  final TextEditingController order = TextEditingController();

  @override
  void initFormFields() {
    title.addListener(() { item.title = title.text; });
    subtitle.addListener(() { item.subtitle = subtitle.text; });
    descr.addListener(() { item.descr = descr.text; });
    order.addListener(() {
      try {item.order = int.parse(order.text);}
      catch (e) { item.order = 0; }
    });
  }

  @override
  void disposeFormFields() {
    title.dispose();
    subtitle.dispose();
    descr.dispose();
    order.dispose();
  }

  @override
  void copyModelToFields() {
    title.text = item.title ;
    subtitle.text = item.subtitle ;
    descr.text = item.descr ;
    order.text = '${item.order}';
  }


  @override
  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        gap(h:24),

        TextField(
          controller: title,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Tytuł')
          ),
        ),
        gap(h:24),

        TextField(
          controller: subtitle,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Podtytuł')
          ),
        ),
        gap(h:24),

        TextField(
          controller: descr,
          minLines: 10,
          maxLines: 100,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              label: Text('Opis')
          ),
        ),
        gap(h:24),

        const Text('Widoczność'),
        Switch(
            value: item.visible,
            onChanged: (value){ setState(() {
              item.visible = value;
            });  }
        ),
        gap(h:24),

        SizedBox(
          width: 150,
          child: TextField(
            controller: order,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                label: Text('Kolejność')
            ),
          ),
        ),
        gap(h:24),

        if(isEditForm) Attachments(adminState: adminState, table: 't_offer', itemId: item.id),

      ],
    );
  }




}