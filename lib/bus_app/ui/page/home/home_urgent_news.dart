part of bus_page_home;


class HomeUrgentNews extends StatelessWidget with PageDataWidget {
  HomeUrgentNews({super.key});

  @override
  Widget build(BuildContext context) {
    init(context);

    return Container(
      width: double.infinity,
      padding:   const EdgeInsets.all(CustomStyles.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: homeNews.map((e) => UrgentNewsItem(title: e.title, content: e.content)).toList()
      ),
    );
  }
}

class UrgentNewsItem extends StatelessWidget {

  final String title;
  final String content;

  const UrgentNewsItem({super.key,  required this.title, required this.content });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomStyles.padding),
      margin: const EdgeInsets.only(bottom: CustomStyles.padding),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 3),
          borderRadius: BorderRadius.circular(CustomStyles.borderRadius)
      ),
      child: Column(
        children: [
          Text(title, style: header2()),
          gap(),
          Text(content, style:  const TextStyle(fontSize: CustomStyles.fsNormal, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          gap(h:24),
        ],
      ),
    );
  }

}




