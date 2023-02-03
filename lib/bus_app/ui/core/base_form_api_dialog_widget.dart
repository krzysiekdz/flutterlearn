import 'package:flutterlearn/bus_app/bus_app.dart';


abstract class BaseFormApiDialogWidget extends BaseFormApiWidget {
  BaseFormApiDialogWidget({  required super.formApiArgs , super.key, super.addTitle, super.editTitle, });
}

abstract class BaseFormApiDialogWidgetState<T extends BaseFormApiDialogWidget, E extends BaseModel> extends BaseFormApiWidgetState<T, E> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isAddForm ?  widget.addTitle : widget.editTitle),
      content: wrapDialogContent() ,
      actions: [
        dialogActions(context,
            btnOk: Text(isAddForm ? 'Dodaj' : 'Zapisz'),
            btnOkAction: isError||isLoading ? null : (){ submit(); }),
      ],
    );
  }


  Widget wrapDialogContent() {
    Widget page;
    if (isError) {
      page =  SizedBox(height: 50, child: Center(child: Text(errMsg , style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)));
    }
    else if(isLoading) {
      page = const SizedBox(height: 50, child: Center(child: CircularProgressIndicator(),));
    }
    else {
      page = Padding(
        padding: const EdgeInsets.all(CustomStyles.padding),
        child: SizedBox(
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: buildFormFields() ,
          ),
        ),
      );
    }

    return page;
  }


  List<Widget> buildFormFields();

}