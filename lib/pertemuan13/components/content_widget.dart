import 'package:flutter/material.dart';
import 'package:my_project/pertemuan13/pertemuan13_provider.dart';
import 'package:provider/provider.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);

    return Center(
      child: Container(
          child: prov.sedangMemanggang == true
              ? SizedBox(
                  width: 100,
                  child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(seconds: prov.sliderValue.round()),
                      builder: (context, double value, _) =>
                          LinearProgressIndicator(
                            value: value,
                          )),
                )
              : prov.selesaiMasak == true
                  ? Tooltip(
                      message: 'Ayam Panggang',
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.F9kz8Jn-AJeKmMYtNPEn5QHaEd?w=223&h=180&c=7&r=0&o=5&pid=1.7',
                        width: 300,
                      ),
                    )
                  : Container()),
    );
  }
}
