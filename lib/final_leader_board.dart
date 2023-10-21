import 'package:flutter/material.dart';
import 'package:scribble_clone/utils/colors.dart';
import 'package:scribble_clone/widget/custom_text.dart';

class FinalLeaderboard extends StatelessWidget {
  final scoreboard;
  final String winner;
  FinalLeaderboard(this.scoreboard, this.winner);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 30),
            ModifiedText(text: "Leader Board", color: dark, size: 28),
            SizedBox(height: 30,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12,),
                    ModifiedText(text: "Score", color: primaryColor, size: 24),
                    const SizedBox(height: 12,),
                    ListView.builder(
                      primary: true,
                      shrinkWrap: true,
                      itemCount: scoreboard.length,
                      itemBuilder: (context, index) {
                        var data = scoreboard[index].values;
                        return ListTile(
                          title: Text(data.elementAt(0),
                              style:
                                  const TextStyle(color: dark, fontSize: 23,fontWeight: FontWeight.bold)),
                          trailing: Text(data.elementAt(1),
                              style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        );
                      }
                    ),
                  ],
                ),
              ),
            // ListView.builder(
            //     primary: true,
            //     shrinkWrap: true,
            //     itemCount: scoreboard.length,
            //     itemBuilder: (context, index) {
            //       var data = scoreboard[index].values;
            //       return ListTile(
            //         title: Text(data.elementAt(0),
            //             style:
            //                 const TextStyle(color: dark, fontSize: 23,fontWeight: FontWeight.bold)),
            //         trailing: Text(data.elementAt(1),
            //             style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold)),
            //       );
            //     }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$winner has won the game!",
                style: TextStyle(
                    color: dark, fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
        ]),
      ),
    );
  }
}