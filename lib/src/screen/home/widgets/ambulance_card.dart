import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hospital/src/models/ambulance.models.dart';

class AmbulanceCard extends StatelessWidget {
  final Ambulance ambulance;
  const AmbulanceCard({Key? key, required this.ambulance}) : super(key: key);
  BorderRadius get borderRadius => BorderRadius.circular(12.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 2,
      ),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 90,
            child: ClipRRect(
              child: CachedNetworkImage(imageUrl: ambulance.thumbnailUrl ?? ""),
              borderRadius: borderRadius,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ambulance.title ?? "",
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 4),
                Text(
                  (ambulance.id ?? "").toString(),
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 2),
                Text("url:${ambulance.url}",
                    style: Theme.of(context).textTheme.caption),
                const SizedBox(height: 4),
                Image.asset(
                  "assets/location.png",
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
                iconSize: 30,
              ))
        ],
      ),
    );
  }
}
