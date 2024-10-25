import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final List _steps = [
    {
      'title': 'Didihkan air di dalam panci (sekitar 400-500 ml).',
      'check': Icons.check_box_outline_blank_outlined,
    },
    {
      'title':
          'Masukkan mi ke dalam air mendidih, dan masak selama 3-4 menit hingga mi matang.',
      'check': Icons.check_box_outline_blank_outlined,
    },
    {
      'title':
          'Sambil menunggu mi matang, siapkan bumbu di piring atau mangkuk.',
      'check': Icons.check_box_outline_blank_outlined,
    },
    {
      'title':
          'Setelah mi matang ,tiriskan air (untuk varian goreng) atau sisakan sedikit air (untik varian kuah).',
      'check': Icons.check_box_outline_blank_outlined,
    },
    {
      'title':
          'Campurkan mi dengan bumbu yang sudah disiapkan , aduk gingga merata.',
      'check': Icons.check_box_outline_blank_outlined,
    },
    {
      'title': 'Sajikan Indomie dan nikmati!',
      'check': Icons.check_box_outline_blank_outlined,
    },
  ];

  var _favoriteIcon = Icons.favorite;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            // background information
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: screen.width * 1.3,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 240, 109, 53),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Image.asset(
                            'assets/indomie.jpg',
                            scale: 2,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //title
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Indomie',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //description
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Indomie adalah mi instan yang dikenal dengan rasa lezat dan bumbu khas, Mudah disajikan dan menjadi favorit di berbagai negara sebagai hidangan cepat dan nikmat.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // rating & favorite button
                Positioned(
                  top: 272,
                  left: 28,
                  child: SizedBox(
                    width: 360,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("4,7/5"),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_favoriteIcon == Icons.favorite) {
                                  _favoriteIcon =
                                      Icons.favorite_border_outlined;
                                } else {
                                  _favoriteIcon = Icons.favorite;
                                }
                              });
                            },
                            icon: Icon(
                              _favoriteIcon,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 510,
                  left: 95,
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      'TO-DO',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _steps.length,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    title: Text(
                      _steps[index]['title'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_steps[index]['check'] ==
                                Icons.check_box_outline_blank_outlined) {
                              _steps[index]['check'] = Icons.check_box;
                            } else {
                              _steps[index]['check'] =
                                  Icons.check_box_outline_blank;
                            }
                          });
                        },
                        icon: Icon(
                          _steps[index]['check'],
                          color: Color.fromARGB(255, 244, 203, 156),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
