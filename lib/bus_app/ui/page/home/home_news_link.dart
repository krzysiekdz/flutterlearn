part of bus_page_home;

class HomeNewsLink extends StatelessWidget with PageDataWidget {
  HomeNewsLink({super.key});

  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.greyLight,
      ),
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if( firstNews != null ) HomeNewsItemWithLink(title: firstNews!.title, content: firstNews!.content),
          ]
      ),
    );
  }
}

class HomeNewsItemWithLink extends StatelessWidget {

  final String title;
  final String content;

  const HomeNewsItemWithLink({super.key,  required this.title, required this.content });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: header2()),
        linePrimary(),
        Text(content, style:  const TextStyle(fontSize: CustomStyles.fsNormal, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        gap(h:32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonLink(text: 'Zobacz aktualności', url: UrlNames.news),
//              OutlinedButton(onPressed: (){ AppRouter().setUrl(UrlNames.news); }, child: Row(
//                children: const [
//                  Text('Zobacz Aktualności'),
//                  Icon(Icons.keyboard_arrow_right),
//                ],
//              ))
          ],
        ),
        gap(h:24),
      ],
    );
  }

}