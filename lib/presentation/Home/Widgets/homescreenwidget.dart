import 'package:flutter/material.dart';
import 'package:phish_defender/api_end_points/data.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/core/constants.dart';
import 'package:phish_defender/core/textstyle.dart';
//import 'package:phish_defender/presentation/Result_screen/loadingscreen.dart';
import 'package:phish_defender/presentation/Result_screen/result.dart';

final textcontroller = TextEditingController();
String newValueController = textcontroller.toString();
final formKey = GlobalKey<FormState>();

class HomeButtonandTextfield extends StatelessWidget {
  static const routename = "check-url-screen";
  const HomeButtonandTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textcontroller,
              validator: urlValidator,
              style: hometextstyletextfieldurl,
              decoration: InputDecoration(
                fillColor: ktransparent.withOpacity(0.2),
                hintText: "ex :https://example.com",
                hintStyle: hometextstyletextfield,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: kgrey,
                  ),
                ),
              ),
            ),
            khight,
            MaterialButton(
              onPressed: () {
                //print(formKey.currentState!.validate());

                String input = textcontroller.text;
                if (formKey.currentState!.validate()) {
                  Datadb.instance.getResult(input);
                  Datadb.instance.getTableResult(input);
                  textcontroller.clear();
                  Navigator.of(context).pushNamed(ResultScreen.routename);
                }
              },
              color: kwhite,
              textColor: kblack,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              minWidth: 150,
              height: 40,
              child: const Text(
                "Submit",
                style: hometextstylebutton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? urlValidator(String? value) {
    var urlPattern =
        r"(https?|http)://([-A-Z0-9.]+\.?)+(:\d+)?(/[-A-Z0-9+&@#/%=~_|!:,.;]*?)?(\?[A-Z0-9+&@#/%=~_|!:.;]*)?";
    if (value == null || value.isEmpty) {
      return "enter valid url";
    } else {
      if (RegExp(urlPattern, caseSensitive: false).hasMatch(value)) {
        return null; // URL is valid
      } else {
        return "Please enter a valid URL"; // Error message
      }
    }
  }
}
