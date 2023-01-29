import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemonapp/model/pokemon_model.dart';
import 'package:pokemonapp/sevice/pokemon_get_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemon App"),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: PokemonGetService.getPokemon(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Color(0xffFC7CFF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: const EdgeInsets.all(10),
                      ),
                      Positioned(
                          left: 35,
                          child: Column(
                            children: [
                              Image.network(
                                snapshot.data['pokemon'][index]['img'],

                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 25,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Color(0xff676767),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("#${snapshot.data['pokemon'][index]['num']}",style: const TextStyle(fontWeight: FontWeight.w700)),
                                    Text(snapshot.data['pokemon'][index]['name'],style: const TextStyle(fontWeight: FontWeight.w900))
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  );
                },
                itemCount: (snapshot.data['pokemon'] as List).length,
              );
            }
          },
        )
        );
  }
}
