import 'package:demo/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogueHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Book Buddy".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Books".text.xl2.make(),
      ],
    );
  }
}