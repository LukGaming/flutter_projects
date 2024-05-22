import 'package:cached_network_image/cached_network_image.dart';
import 'package:chuva_dart/models/people_model.dart';
import 'package:chuva_dart/pages/profile/profile_presenter.dart';
import 'package:flutter/material.dart';

class ShowPeople extends StatelessWidget {
  final PeopleModel people;
  const ShowPeople({super.key, required this.people});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePresenter(people: people)));
      },
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                people.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(people.instituition),
            ],
          )
        ],
      ),
    );
  }
}
