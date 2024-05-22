import 'package:cached_network_image/cached_network_image.dart';
import 'package:chuva_dart/models/people_model.dart';
import 'package:flutter/material.dart';

class DataPeople extends StatelessWidget {
  final PeopleModel people;
  const DataPeople({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: people.picture != null
              ? CachedNetworkImage(
                  imageUrl: people.picture!,
                  imageBuilder: (context, image) => CircleAvatar(
                    backgroundImage: image,
                  ),
                )
              : const Icon(
                  Icons.person,
                  size: 60,
                  color: Color.fromARGB(255, 149, 149, 149),
                ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                people.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                people.instituition,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }
}
