import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scribble_clone/utils/colors.dart';
import 'package:scribble_clone/widget/custom_bottom.dart';
import 'package:scribble_clone/widget/custom_text.dart';

import 'create_room_screen.dart';
import 'join_room_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: ModifiedText(text: "Scribble", color: Colors.white, size: 26),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.person_pin,size: 40,),
              onPressed: () {
                // Scaffold.of(context).openDrawer();
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: bluishWhite,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image:AssetImage("assets/icons/scribble_2.png") ,
            opacity: .16,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              // child:ModifiedText(text: "Hi, Guest User", color: dark, size: 24)
              child: DefaultTextStyle(
                style: GoogleFonts.aclonica(color: dark, fontSize:24), 
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Hi, Guest User',speed: Duration(milliseconds: 500),cursor: "|",curve: Curves.bounceOut),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: ModifiedText(
                      text: "Let's create or join room to play this interesting game", 
                      color: stealLight, 
                      size: 21
                    )
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.1,
            // ),
            // const Spacer(),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: CustomButton(
                    title: "Create", 
                    textSize: 20,
                    onPress: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateRoomScreen(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: CustomButton(
                    title: "Join", 
                    textSize: 20,
                    onPress: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const JoinRoomScreen(),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () => Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => const CreateRoomScreen(),
                //     ),
                //   ),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.blue),
                //       textStyle: MaterialStateProperty.all(
                //           TextStyle(color: Colors.white)),
                //       minimumSize: MaterialStateProperty.all(
                //           Size(MediaQuery.of(context).size.width / 2.5, 50))),
                //   child: const Text(
                //     "Create",
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () => Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => const JoinRoomScreen(),
                //     ),
                //   ),
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.blue),
                //       textStyle: MaterialStateProperty.all(
                //           TextStyle(color: Colors.white)),
                //       minimumSize: MaterialStateProperty.all(
                //           Size(MediaQuery.of(context).size.width / 2.5, 50))),
                //   child: const Text(
                //     "Join",
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}