import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hospital/src/models/hosptial.models.dart';
import 'package:hospital/src/provider/hospital.provider.dart';
import 'package:hospital/src/screen/home/widgets/ambulance_card.dart';
import 'package:hospital/src/screen/home/widgets/body_painter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Image.asset(
                        "assets/ambulance.png",
                        height: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text("Near by Ambulance")
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final _hospitalState = ref.watch(hospitalProvider);
                    if (_hospitalState.hospitals == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (_hospitalState.hospitals!.length == 0) {
                      return const Center(child: Text("No Ambulance Near You"));
                    } else {
                      return Flexible(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Ambulance ambulance =
                                _hospitalState.hospitals![index];
                            return AmbulanceCard(ambulance: ambulance);
                          },
                        ),
                      );
                    }
                  },
                )
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
