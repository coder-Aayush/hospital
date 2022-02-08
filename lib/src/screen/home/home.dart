import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital/src/provider/hospital.provider.dart';
import 'package:hospital/src/screen/home/widgets/body_painter.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _hospitalState = ref.watch(hospitalProvider);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Hospital"),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.bus_alert),
                      SizedBox(width: 10),
                      Text("Near by Ambulance")
                    ],
                  ),
                ),
               
              ],
            ),
            CustomPaint(
              painter: BodyPainter(),
              child: Container(height: 0),
            ),
          ],
        ));
  }
}
