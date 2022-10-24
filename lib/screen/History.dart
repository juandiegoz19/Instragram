import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram/model/people.dart';

class History extends ConsumerWidget {
  const History({required this.photo, super.key});
  final Photo photo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(photo.src.portrait, fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(photo.src.tiny),
                      maxRadius: 22),
                  const SizedBox(width: 10),
                  Text(photo.photographer,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                alignment: Alignment.topRight,
                color: Colors.black12,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 35,
                      color: Colors.grey,
                    )),
              ))
        ],
      ),
    );
  }
}
