import 'package:flutter/material.dart';
import 'package:icode_test/pages/home.dart';
import 'package:icode_test/widgets/gradient_text_widget.dart';

Future<void> exitDialog(BuildContext context, message, button, button2) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(30),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        content: SizedBox(
          width: 332,
          height: 126,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 4)),
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset('assets/images/orange.png'),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(left: 100)),
                    SizedBox(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 24,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset('assets/images/exit.png'),
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                SizedBox(
                  width: 230,
                  height: 61,
                  child: GradientText(message, "Ribeye", 24, 0.1661, 0.961, false),
                )
              ]
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 16),
        actionsPadding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 24),
        actions: <Widget>[
          SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 134,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFD3D3D3),
                        Color(0xFFD3D3D3),
                      ]),
                    borderRadius: BorderRadius.circular(25),
                    ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        /*shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))*/),
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ),
                const Padding(padding: EdgeInsets.only(left: 16)),
                SizedBox(
                    width: 134,
                    height: 45,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFE86B02),
                              Color(0xFFFA9541)
                            ]),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          /*shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))*/),
                        child: const Text(
                          "No",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                ),
              ],
            )
          ),
        ],
      );
    },
  );
}
