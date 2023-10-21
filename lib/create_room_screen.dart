import 'package:flutter/material.dart';
import 'package:scribble_clone/painting_screen.dart';
import 'package:scribble_clone/utils/colors.dart';
import 'package:scribble_clone/widget/custom_bottom.dart';
import 'package:scribble_clone/widget/custom_text.dart';
import 'package:scribble_clone/widget/custome_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundsValue;
  late String? _roomSizeValue;

  void createRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _roomSizeValue != null) {
          Map<String, String> data = {
            "nickname": _nameController.text,
            "name": _roomNameController.text,
            "occupancy": _maxRoundsValue!,
            "maxRounds": _roomSizeValue!
          };
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom')));
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Create Room", color: Colors.white, size: 26),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Enter Details",
              //   style: TextStyle(
              //     color: dark,
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold
              //   ),
              // ),
              SizedBox(height: 20),
              ModifiedText(text: "Enter Details", color: dark, size: 24),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.08),
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

              SizedBox(height: 20),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                child: DropdownButton<String>(
                  focusColor: Color(0xffF5F6FA),
                  items: <String>["2", "5", "10", "15"]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                  hint: const Text('Select Max Rounds',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  onChanged: (String? value) {
                    setState(() {
                      _maxRoundsValue = value;
                    });
                  },
                ),
              ),

              SizedBox(height: 10),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                child: DropdownButton<String>(
                  focusColor: Color(0xffF5F6FA),
                  items: <String>["2", "3", "4", "5", "6", "7", "8"]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                      .toList(),
                  hint: const Text('Select Room Size',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  onChanged: (String? value) {
                    setState(() {
                      _roomSizeValue = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 40),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.maxFinite,
                child: CustomButton(
                  title: "Create", 
                  onPress: createRoom,
                  textSize: 20,
                  letterSpacing: 1,
                  loading: false,
                ),
              ),
              // ElevatedButton(
              //   onPressed: createRoom,
              //   child: const Text(
              //     "Create",
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