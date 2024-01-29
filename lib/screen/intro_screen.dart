import 'package:boleto_scan/screen/dashboard.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool last = false;

  int ind = 0;

  
  onPage(int index) {
    setState(() {
      ind = index;
    });
  }
  @override


  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          controller.jumpToPage(2);
                        });
                      },
                      child: Text(
                        "PASSER",
                        style:
                            TextStyle(color: ind != 2 ? Color(0xffe60023) : Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                PageView(
                  controller: controller,
                  onPageChanged: onPage,
                  physics: BouncingScrollPhysics(),
                  
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset("lib/assets/splash1.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Evenements de toutes catégories sont içi et vous attendent",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset("lib/assets/splash2.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Ce que vous chercher est disponible içi , explorez",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset("lib/assets/splash3.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Bienvenue, nous sommes heureux de vous compter parmis nous ",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      width: 80,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 0 ? Color(0xffe60023) : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 1 ? Color(0xffe60023) : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          ind == 2 ? Color(0xffe60023) : Colors.grey),
                                  width: 10,
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Color(0xffe60023)),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward_sharp),
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    if (ind != 2) {
                                      controller.nextPage(
                                          duration: Duration(milliseconds: 600),
                                          curve: Curves.easeInOut);
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()),
                                      );
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}