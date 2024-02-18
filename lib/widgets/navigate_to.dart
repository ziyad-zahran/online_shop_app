import 'package:flutter/material.dart';

class NavigateTo
{

  void navigateTo({required BuildContext context,required String id,@required dynamic arguments}) {
    Navigator.pushNamed(context, id,arguments: arguments);
  }
}
