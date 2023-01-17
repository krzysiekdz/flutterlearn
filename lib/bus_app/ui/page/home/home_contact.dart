part of bus_page_home;


class HomeContact extends StatelessWidget with PageDataWidget {

  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
      decoration:  BoxDecoration(
        color:  (firstNews == null) ?  CustomColors.greyLight : Colors.transparent,
      ),
      padding: const EdgeInsets.all(CustomStyles.padding),
      width: double.infinity,

      child: Column(
        children: [
          Text('Kontakt', style: header4(),),
          gap(),
          Text('tel. (+48) 604 281 529', style:  header4(),),
          gap(),
          Text('email: staszek.bus@interia.pl', style:  header4(),),
          gap(),
          link(text: 'Zobacz więcej', action: (){ AppRouter().setUrl(UrlNames.contact); }),
          gap(),
        ],
      ),
    );
  }
}