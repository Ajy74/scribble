import 'package:flutter/material.dart';
import 'package:scribble_clone/painting_screen.dart';
import 'package:scribble_clone/utils/colors.dart';
import 'package:scribble_clone/widget/custom_bottom.dart';
import 'package:scribble_clone/widget/custom_text.dart';
import 'package:scribble_clone/widget/custome_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();

  void joinRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty) {
      Map<String, String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text
      };

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'joinRoom'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Join Room", color: Colors.white, size: 26),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Join Room",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 30,
              //   ),
              // ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              SizedBox(height: 20),
              ModifiedText(text: "Enter Details", color: dark, size: 24),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextField(
                  controller: _nameController,
                  hintText: "Enter your name",
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomTextField(
                  controller: _roomNameController,
                  hintText: "Enter Room Name",
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                child: CustomButton(
                  title: "Join", 
                  onPress: joinRoom,
                  textSize: 20,
                  letterSpacing: 1,
                  loading: false,
                ),
              ),
              
              // ElevatedButton(
              //   onPressed: joinRoom,
              //   child: const Text(
              //     "Join",
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(Colors.blue),
              //       textStyle:
              //           MaterialStateProperty.all(TextStyle(color: Colors.white)),
              //       minimumSize: MaterialStateProperty.all(
              //           Size(MediaQuery.of(context).size.width / 2.5, 50))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}