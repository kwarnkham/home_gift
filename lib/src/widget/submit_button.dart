import 'package:flutter/material.dart';
import '../home_gift_theme.dart';

class SubmitButton extends StatefulWidget {
  final String label;
  final onPressed;
  SubmitButton({@required this.label, @required this.onPressed});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      child: LayoutBuilder(
        builder: (context, constraints) => RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 17),
          splashColor: HomeGiftTheme.gradientFirstColor,
          textTheme: ButtonTextTheme.primary,
          color: HomeGiftTheme.secondayColor,
          child: isLoading
              ? SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    backgroundColor: HomeGiftTheme.gradientSecondColor,
                  ),
                )
              : Text(widget.label),
          onPressed: isLoading
              ? null
              : () {
                  setState(() {
                    isLoading = true;
                  });
                  widget.onPressed(context).then((_) {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
        ),
      ),
    );
  }
}
