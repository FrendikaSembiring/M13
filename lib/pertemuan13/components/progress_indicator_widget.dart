import 'package:flutter/material.dart';
import 'package:my_project/pertemuan13/pertemuan13_provider.dart';
import 'package:provider/provider.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan13Provider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(100, 90)),
      onPressed: () {
        if (prov.sliderValue.round() == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Invalid Duration'),
                content: Text('The duration cannot be 0.'),
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        } else {
          prov.mulaiMemanggang(prov.sliderValue.round());
        }
      },
      child: prov.sedangMemanggang == true
          ? DeterminateIndicator(
              value: prov.progressValue,
              color: Colors.white,
            )
          : const Text('Panggang'),
    );
  }
}

class DeterminateIndicator extends StatelessWidget {
  final double value;
  final Color color;

  const DeterminateIndicator({
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      color: color,
    );
  }
}
