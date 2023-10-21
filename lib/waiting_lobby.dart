import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribble_clone/utils/colors.dart';
import 'package:scribble_clone/widget/custom_text.dart';

class WaitingLobbyScreen extends StatefulWidget {
  final int occupancy;
  final int noOfPlayers;
  final String lobbyName;
  final players;
  const WaitingLobbyScreen(
      {Key? key,
      required this.occupancy,
      required this.noOfPlayers,
      required this.lobbyName,
      required this.players})
      : super(key: key);

  @override
  _WaitingLobbyScreenState createState() => _WaitingLobbyScreenState();
}

class _WaitingLobbyScreenState extends State<WaitingLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ModifiedText(text: "Waiting Lobby", color: dark, size: 28),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                    '${widget.occupancy - widget.noOfPlayers} more players need to join', 
                    style: TextStyle(fontSize: 25,color: dark,fontWeight: FontWeight.bold)
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                readOnly: true,
                onTap: () {
                  // copy room code
                  Clipboard.setData(ClipboardData(text: widget.lobbyName));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Copied!')));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: const Color(0xffF5F5FA),
                  hintText: 'Tap to copy room name !',
                  hintStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                  suffixIcon: Icon(Icons.copy)
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                  ModifiedText(text: "Joined Players", color: primaryColor, size: 24),
                  const SizedBox(height: 12,),
                  ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: widget.noOfPlayers,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                        child: Text(
                          "${index + 1}. ${widget.players[index]['nickname']}",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      );
                      // return ListTile(
                      //   leading: Text(
                      //     "${index + 1}.",
                      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      //   ),
                      //   title: Text(
                      //     widget.players[index]['nickname'],
                      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      //   ),
                      // );
                    }
                  )
                ],
              ),
            ),
            // Text('Players: ', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: dark)),
            // ListView.builder(
            //     primary: true,
            //     shrinkWrap: true,
            //     itemCount: widget.noOfPlayers,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         leading: Text(
            //           "${index + 1}.",
            //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //         ),
            //         title: Text(
            //           widget.players[index]['nickname'],
            //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //         ),
            //       );
            //     })
          ],
        ),
      ),
    );
  }
}