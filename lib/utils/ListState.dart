import 'package:flutter/material.dart';
import 'Repo.dart';
import 'Response.dart' as okdev;

abstract class ListState<T extends StatefulWidget, E> extends State<T> with AutomaticKeepAliveClientMixin<T> {

  late final Repo<E> repo;//zamiast repo uzywac klasy, ktora operuje na limit, page, ma metody getNextPage itp
  late List<E>? items = [];

  bool isLoading = true;
  bool isEmpty = true;
  bool isAllFetched = false;
  bool isError = false;
  bool get wantKeepAlive => true;

  String msg = '';

  int get limit => 20;
  int page = 0;
  int get nextPageTrigger => 0;

  int fetchCount = 0;//to tak samo opakowac w klasę
  Map<int, bool> canRunFetch = {};


  @override
  void initState() {
    super.initState();
    print('ListState : initState');

    repo = createRepo();
    runOnceFetchData();
  }

  Repo<E> createRepo();

  void runOnceFetchData({bool joinData = false}) {
    fetchData(fetchCount++, joinData: joinData);
  }

  Future<void> fetchData(int id, {bool joinData = false}) async {
    //fetchData może być wywołane kilka razy - np najpierw pagination a potem refresh, bez czekania na efekt pagination
    canRunFetch.clear();
    canRunFetch[id] = true;

    isLoading = true;
    okdev.Response<E> res = await repo.list(start : limit * page, limit : limit);

    bool canRun = canRunFetch[id] ?? false;
    if(! canRun) return;

    print('fetch success! , res size = ${res.data?.length}');

    if(res.code >= 0) {
      if(joinData) {
        items?.addAll(res.data ?? []);
      } else {
        items = res.data;
      }

      if(res.data == null || res.data!.isEmpty || res.data!.length < limit) {
        isAllFetched = true;
      }
      msg = '';
      isError = false;
    }
    else {
      isError = true;
      msg = res.msg;
      if(joinData) page--;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('ListState : didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('ListState : build');

    return Center(
      child: (isLoading && isEmpty)
          ? const CircularProgressIndicator()
          : RefreshIndicator(child: buildList(context), onRefresh: onRefresh ),
    );
  }

  Future<void> onRefresh() async {
    setState(() {
      items = [];
      page = 0;
      isEmpty = true;
      isLoading = true;
      isAllFetched = false;
      isError = false;
    });
    runOnceFetchData();
  }

  Widget buildList(BuildContext context) {
    int itemCount = getItemCount();

    if(isError && isEmpty) {
      return errorMsg(msg);
    }
    else if(isEmpty) {
      return emptyList();
    }
    else {
      return listBuilder(itemCount);
    }
  }

  Widget listBuilder(int itemCount) {
    return ListView.builder(
      itemBuilder: buildItem,
      itemCount: itemCount,
    );
  }

  int getItemCount() {
    if (items?.isNotEmpty ?? false) {
      isEmpty = false;
      return items!.length + 1;
    }
    else {
      isEmpty = true;
      return 0;
    }
  }

  Widget emptyList() {
    return const Text('brak danych',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget errorMsg(String s, {bool canLoadNextPage = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(s, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(
          width: 150,
          child: ElevatedButton(
              onPressed: () {
                if(canLoadNextPage) {
                  loadNextPage();
                }
                else {
                  runOnceFetchData();
                }

                setState(() {
                  isLoading = true;
                  isError = false;
                });
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Icon(Icons.refresh), SizedBox(width: 10), Text('Ponów')])
          ),
        ),
      ],
    );
  }

  Widget buildItem(BuildContext context, int i) {
    print('ListState : buildItem $i');

    int size = items!.length;
    //check to fetch data...
    if( ((size - i) <= nextPageTrigger) && !isLoading && !isAllFetched && !isError) {
      loadNextPage();
    }

    if(i == size) { //osatni element - loader lub pusty
      return buildLastItem();
    }

    return buildListElement(items?[i], context, i);
  }

  Widget buildListElement(E? item, BuildContext context, int i);

  Widget buildLastItem() {
    if(isAllFetched) {
      return Container();
    }
    else if (isLoading) {
      return loaderNextPage();
    }
    else if (isError) {
      return errorMsg(msg, canLoadNextPage: true);
    }
    else {
      loadNextPage();
      return loaderNextPage();
    }
  }

  void loadNextPage() {
    isLoading = true; //tu nie zmieniamy stanu specjalnie, bo nie chcemy aby był widoczny tylko loader, jak przy pierwszym ładowaniu
    page++;//jesli byl error to page--
    runOnceFetchData(joinData: true);
  }

  Widget loaderNextPage() {
    return const Center(child: CircularProgressIndicator());
  }

}