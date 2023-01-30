import 'package:flutter/material.dart';
import 'package:pokemonn/core/widgets/container_widget.dart';
import 'package:pokemonn/core/widgets/text_widget.dart';
import 'package:pokemonn/data/model/pokemon_model.dart';

class InfoPage extends StatelessWidget {
  final Pokemon data;

  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(flex: 3, child: _appBar(context)),
          Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textHelper("#", const Color(0xffFC7CFF), 20,
                              data.id.toString(), FontWeight.bold),
                          textHelper("", Colors.black, 20, data.name.toString(),
                              FontWeight.bold),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFC7CFF),
                                  borderRadius: BorderRadius.circular(40)),
                            ),
                            Positioned(
                                bottom: 50,
                                child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(data.img.toString()),
                                          fit: BoxFit.fill)),
                                ))
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          containerHelper(
                              context,
                              const Color(0xffffc600),
                              0.065,
                              0.35,
                              textHelper("height:\n", Colors.white, 20,
                                  data.height.toString(), FontWeight.bold)),
                          containerHelper(
                              context,
                              const Color(0xff0083FC),
                              0.065,
                              0.35,
                              textHelper("weight:\n", Colors.white, 20,
                                  data.weight.toString(), FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffFA5AFD),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                      ),
                      child: Column(children: [
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
                      ],),
                    )
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Column _appBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 31),
          child: Image.asset("assets/pokemon.png"),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
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
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.format_list_bulleted_rounded)),
          ],
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
