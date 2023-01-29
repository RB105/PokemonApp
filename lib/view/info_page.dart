import 'package:flutter/material.dart';

import 'package:pokemonapp/model/pokemon_model.dart';

class InfoPage extends StatelessWidget {
  final Pokemon data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("#${data.num.toString()}", style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff000000))),
                Text(data.name.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff000000))),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Stack(
            children: [
              Container(
                height: 205,
                width: 371,
                decoration: BoxDecoration(
                    color: const Color(0xffFC7CFF),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Positioned(
                  left: 54,
                  height: 247,
                  width: 289,
                  child: Container(
                    decoration:  BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(
                                data.img.toString()))),
                  ))
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 174,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffFCA600)),
                child:  Center(
                  child: Text(data.type![0].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 16)),
                ),
              ),
              Container(
                width: 174,
                height: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0083FC)),
                child:  Center(
                  child: Text(
                    data.type![1].name,
                    style:const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffFA5AFD),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        "Weaknesses",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Text(
                          data.height.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                         Text(
                          data.weight.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:  [
                               const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xff1D8FF8)),
                               const SizedBox(
                                  width: 6,
                                ),
                                Text(data.weaknesses![0].name.toString(),
                                    style:const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white))
                              ],
                            ),
                            Row(
                              children:  [
                               const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xffFBD92A)),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(data.weaknesses![0].name.toString(),
                                    style:const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white))
                              ],
                            ),
                            Row(
                              children:  [
                               const CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xffCA9E03)),
                               const SizedBox(
                                  width: 6,
                                ),
                                Text(data.weaknesses![2].name.toString(),
                                    style:const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Egg",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Spawn_time",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text("    "),
                    ],
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Text(
                          data.egg!.name.toString(),
                          style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                       const SizedBox(
                        width: 10,
                      ),
                        Text(
                          data.spawnTime.toString(),
                          style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      const  Text("   ")
                      ],
                    ),
                  ),
                  const SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                         const Text(
                            "Previous",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Text(
                              data.prevEvolution![1].name.toString(),
                              style:const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 233,
                        height: 118,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/endcont.png"))),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}








// import 'package:flutter/material.dart';

// import 'package:pokemonapp/model/pokemon_model.dart';

// class InfoPage extends StatefulWidget {
//   final Pokemon  data;
//   const InfoPage({super.key,required this.data});

//   @override
//   State<InfoPage> createState() => _InfoPageState();
// }

// class _InfoPageState extends State<InfoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: SizedBox(
//           width: 228,
//           height: 40,
//           child: TextFormField(
//             maxLength: 15,
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: const Color(0xffE5E5E5),
//                 contentPadding: const EdgeInsets.only(bottom: 19),
//                 focusedBorder:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 )),
//           ),
//         ),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.settings_suggest))
//         ],
//       ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     const SizedBox(height: 30),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children:  [
      //           Text(data.id.toString()),
      //           Text("name",
      //               style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w800,
      //                   color: Color(0xff000000))),
                         
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 14,
      //     ),
      //     Stack(
      //       children: [
      //         Container(
      //           height: 205,
      //           width: 371,
      //           decoration: BoxDecoration(
      //               color: const Color(0xffFC7CFF),
      //               borderRadius: BorderRadius.circular(30)),
      //         ),
      //         Positioned(
      //             left: 54,
      //             height: 247,
      //             width: 289,
      //             child: Container(
      //               decoration: const BoxDecoration(
      //                   color: Colors.transparent,
      //                   image: DecorationImage(
      //                       image: NetworkImage(
      //                           "http://www.serebii.net/pokemongo/pokemon/006.png"))),
      //             ))
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 24,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Container(
      //           width: 174,
      //           height: 38,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               color: const Color(0xffFCA600)),
      //           child: const Center(
      //             child: Text("Fuego",
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.w800,
      //                     color: Colors.white,
      //                     fontSize: 16)),
      //           ),
      //         ),
      //         Container(
      //           width: 174,
      //           height: 38,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               color: const Color(0xff0083FC)),
      //           child: const Center(
      //             child: Text(
      //               "Volvador",
      //               style: TextStyle(
      //                   fontWeight: FontWeight.w800,
      //                   color: Colors.white,
      //                   fontSize: 16),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 25,
      //     ),
      //     Expanded(
      //       child: Container(
      //         decoration: const BoxDecoration(
      //             color: Color(0xffFA5AFD),
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(60),
      //                 topRight: Radius.circular(60))),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: const [
      //                 Text(
      //                   "fugo",
      //                   style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w800,
      //                       color: Colors.white),
      //                 ),
      //                 Text(
      //                   "Chaves",
      //                   style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w800,
      //                       color: Colors.white),
      //                 ),
      //                 Text(
      //                   "SALOM",
      //                   style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w800,
      //                       color: Colors.white),
      //                 ),
      //               ],
      //             ),
      //             Opacity(
      //               opacity: 0.7,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   const Text(
      //                     "fugo",
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w800,
      //                         color: Colors.white),
      //                   ),
      //                   const Text(
      //                     "Chaves",
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w800,
      //                         color: Colors.white),
      //                   ),
      //                   Container(
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: [
      //                         Row(
      //                           mainAxisAlignment: MainAxisAlignment.end,
      //                           children: const [
      //                             CircleAvatar(
      //                                 radius: 10,
      //                                 backgroundColor: Color(0xff1D8FF8)),
      //                             SizedBox(
      //                               width: 6,
      //                             ),
      //                             Text("Agua",
      //                                 style: TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.w800,
      //                                     color: Colors.white))
      //                           ],
      //                         ),
      //                         Row(
      //                           children: const [
      //                             CircleAvatar(
      //                                 radius: 10,
      //                                 backgroundColor: Color(0xffFBD92A)),
      //                             SizedBox(
      //                               width: 6,
      //                             ),
      //                             Text("Electricidad",
      //                                 style: TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.w800,
      //                                     color: Colors.white))
      //                           ],
      //                         ),
      //                         Row(
      //                           children: const [
      //                             CircleAvatar(
      //                                 radius: 10,
      //                                 backgroundColor: Color(0xffCA9E03)),
      //                             SizedBox(
      //                               width: 6,
      //                             ),
      //                             Text("Roca",
      //                                 style: TextStyle(
      //                                     fontSize: 16,
      //                                     fontWeight: FontWeight.w800,
      //                                     color: Colors.white))
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 41,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: const [
      //                 Text(
      //                   "Peso",
      //                   style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w800,
      //                       color: Colors.white),
      //                 ),
      //                 Text(
      //                   "Sexo",
      //                   style: TextStyle(
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w800,
      //                       color: Colors.white),
      //                 ),
      //                 Text("    "),
      //               ],
      //             ),
      //             Opacity(
      //               opacity: 0.7,
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: const [
      //                   Text(
      //                     "95 kg",
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w800,
      //                         color: Colors.white),
      //                   ),
      //                   Text(
      //                     "0-",
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w800,
      //                         color: Colors.white),
      //                   ),
      //                   Text("   ")
      //                 ],
      //               ),
      //             ),
      //            const SizedBox(height: 19),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   children: const [
      //                     Text(
      //                       "Peso",
      //                       style: TextStyle(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w800,
      //                           color: Colors.white),
      //                     ),
      //                     Opacity(
      //                       opacity: 0.7,
      //                       child: Text(
      //                         "Mar Lamas",
      //                         style: TextStyle(
      //                             fontSize: 16,
      //                             fontWeight: FontWeight.w800,
      //                             color: Colors.white),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Container(
      //                   width: 233,
      //                   height: 118,
      //                   decoration: const BoxDecoration(
      //                     image: DecorationImage(image: AssetImage("assets/endcont.png"))
      //                   ),
      //                 )
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
//     );
//   }
// }

