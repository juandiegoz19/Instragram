import 'dart:io' show HttpHeaders;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/people.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<People> people(String type) async {
    final response = await http.get(
        Uri.parse(type.isEmpty ? 'https://api.pexels.com/v1/curated?per_page=80' :'https://api.pexels.com/v1/search?per_page=80&query=$type'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer 563492ad6f91700001000001615e94e989a249d28d6581a35e444715',
        });
    return peopleFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Instagram'),
          centerTitle: false,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 25),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                )),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.home_filled),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.search_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.movie_creation_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.local_mall_outlined),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            FutureBuilder<People>(
                future: people('portrait'),
                builder:
                    (BuildContext context, AsyncSnapshot<People> snapshot) {
                  Widget children =
                      const Center(child: CircularProgressIndicator());
                  if (snapshot.hasData) {
                    children = SizedBox(
                      height: 70,
                      child: ListView.builder(
                          cacheExtent: 80,
                          itemCount: snapshot.data?.photos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 1.5),
                                  borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  snapshot.data?.photos[index].src.tiny ?? '',
                                  width: 55,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    children = Container();
                  }
                  return children;
                }),
            Expanded(
              child: FutureBuilder<People>(
                future: people(''),
                builder:
                    (BuildContext context, AsyncSnapshot<People> snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  } else if (snapshot.hasData) {
                    People? people = snapshot.data;
                    return ListView.builder(
                      cacheExtent: 9999999,
                        itemCount: snapshot.data?.photos.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 10, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            'https://yt3.ggpht.com/o20SwR0uf6WqFp_7Tum2ELXngxGQtvdP2ggYBWek1fg-tmGkdlsbg96c10N1YvdDeeRaJXRgrA=s900-c-k-c0x00ffffff-no-rj',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                          child: Text(
                                        people?.photos[index].photographer ?? '',
                                        style:const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      const Icon(
                                        Icons.more_horiz,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white60, width: 1.5),
                                  ),
                                  child: Image.network(
                                    people?.photos[index].src.large ?? '',
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          Icon((people?.photos[index].id ?? 10) % 2 != 0 ? Icons.favorite : Icons.favorite_border_outlined,
                                              size: 30, color: (people?.photos[index].id ?? 10) % 2 != 0 ? Colors.red: Colors.black),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Icon(
                                              Icons
                                                  .mode_comment_outlined,
                                              size: 30),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Icon(Icons.send_outlined, size: 30),
                                        ],
                                      )),
                                      const Icon(Icons.bookmark_border_outlined,
                                          size: 30),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'https://cdn.elnacional.com/wp-content/uploads/2019/11/John-Legend-Foto-Archivo.jpg',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Les gusta a juan.diego.z y otros',
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Hace una hora',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
