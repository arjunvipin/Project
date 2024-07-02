import 'dart:developer';


import 'package:flutter/material.dart';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:phish_defender/api_end_points/api_key.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/presentation/Home/Widgets/massagewidget.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final FocusNode textfieldfocus = FocusNode();
  final TextEditingController textcontroller = TextEditingController();
  bool loading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: "gemini-pro",
      apiKey: apiKey,
    );
    _chatSession = _model.startChat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _chatSession.history.length,
              itemBuilder: (context, index) {
                final Content content = _chatSession.history.toList()[index];
                final text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return MassageWidget(
                  text: text,
                  isformtext: content.role == "user" ? 'true' : 'false',
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: textfieldfocus,
                    controller: textcontroller,
                    decoration: textfielddecoration(),
                    //onSubmitted: sendmassage,
                    style: const TextStyle(color: kwhite),
                  ),
                ),
                IconButton(
                  onPressed: () => sendmassage(textcontroller
                      .text), // Call sendmassage function with the text from the controller
                  icon: const Icon(Icons.send_outlined,size: 40,color: kwhite,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InputDecoration textfielddecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: "Enter a prompt",
      hintStyle: const TextStyle(color: kwhite),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }

  Future<void> sendmassage(String massage) async {
    setState(() {
      loading = true;
    });
    try {
      final response = await _chatSession.sendMessage(Content.text(massage));
      final text = response.text;
      log(text.toString());
      if (text == null) {
        _showerror("not response for api");
        return;
      } else {
        loading = false;
        _scrolldown();
      }
    } catch (e) {
      _showerror(e.toString());
      setState(() {
        loading = false;
      });
    } finally {
      textcontroller.clear();
      setState(() {
        loading = false;
      });
      textfieldfocus.requestFocus();
    }
  }

  void _showerror(String massage) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SnackBar(
          content: Text(
            massage,
            style: const TextStyle(
              color: kwhite,
              fontSize: 16,
            ),
          ),
          backgroundColor: kblack,
        );
      },
    );
  }

  void _scrolldown() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeInOut,
            ));
  }
}
