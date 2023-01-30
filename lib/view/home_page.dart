import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/model/pokemon_model.dart';
import '../data/service/pokemon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(flex: 3, child: _appBar()),
          Expanded(
            flex: 7,
            child: _body(),
          ),
        ],
      ),
    );
  }

  SizedBox _body() {
    return SizedBox(
            child: FutureBuilder(
              future: PokemonGetService.getPokemon(),
              builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                           Navigator.pushNamed(context, 'info');
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 200,
                                decoration: const BoxDecoration(
                                    color: Color(0xffFC7CFF),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                margin: const EdgeInsets.all(10),
                              ),
                              Positioned(
                                  left: 35,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        snapshot.data!.pokemon![index].img
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 130,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff676767),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                                snapshot.data!.pokemon![index]
                                                    .name!,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w900))
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        );
                      },
                      itemCount: (snapshot.data!.pokemon!.length));
                }
              },
            ),
          );
  }

  Column _appBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 31),
          child: Image.asset("assets/pokemon.png"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: TextFormField(
            showCursor: false,
            maxLength: 15,
            maxLines: 1,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Search Pokemon",
                filled: true,
                fillColor: const Color(0xffE5E5E5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none)),
          ),
        ),
        Container(
          height: 5,
          width: double.infinity,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset(0.0, -5.0), blurRadius: 5.0)
          ]),
        )
      ],
    );
  }
}
