
import 'package:flutter/material.dart';
import 'package:flutterlearn/bsxmobile/styles/styles.dart';

enum ButtonType {
  elevated, outlined
}

class LoaderButton extends StatefulWidget {
  Widget child;
  VoidCallback onPressed;
  ButtonType type;
  bool enabled;

  LoaderButton({
    super.key,
    required this.child ,
    required this.onPressed,
    this.type = ButtonType.elevated,
    this.enabled = true,
  });

  @override
  State<StatefulWidget> createState() => LoaderButtonState();
}

class LoaderButtonState extends State<LoaderButton> {

  bool isLoading = false;
  late bool isEnabled ;

  @override
  void initState() {
    super.initState();

    isEnabled = widget.enabled;
  }

  void setLoading(bool load) {
    setState(() {
      isLoading = load;
    });
  }

  void setEnabled() {
    setState(() {
      isEnabled = true;
    });
  }

  void setDisabled() {
    setState(() {
      isEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (isLoading || !isEnabled) ? 0.5 : 1,
      child: ( widget.type == ButtonType.elevated) ? _buildElevated(context) : _buildOutlined(context),
    );
  }

  Widget _buildElevated(BuildContext context) {
    return  ElevatedButton(
        onPressed: (!isLoading && isEnabled) ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(disabledBackgroundColor: Colors.grey, disabledForegroundColor: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.child,
            gap(),
            if(isLoading) const CircularProgressIndicator(),
          ],
        )
    );
  }

  Widget _buildOutlined(BuildContext context) {
    return  OutlinedButton(
        onPressed: (!isLoading && isEnabled) ? widget.onPressed : null,
        style: OutlinedButton.styleFrom(disabledForegroundColor: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.child,
            gap(),
            if(isLoading) const CircularProgressIndicator(),
          ],
        )
    );
  }
}