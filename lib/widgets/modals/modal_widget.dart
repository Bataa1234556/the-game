import 'package:flutter/material.dart';
import 'package:icode_test/widgets/buttons/gradient_button_widget.dart';
import 'package:icode_test/widgets/gradient_text_widget.dart';

Future<void> dialogBuilder(BuildContext context, message, button) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(48),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          content: SizedBox(
            width: 330,
            height: 100,
            /*child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const Padding(padding: EdgeInsets.only(top: 78)),
                  GradientText(message, "Ribeye", 24, 0.1661, 0.961, false),
                ]
            ),*/
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
                      const Padding(padding: EdgeInsets.only(left: 80)),
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
                    height: 33,
                    child: GradientText(message, "Ribeye", 24, 0.1661, 0.961, false),
                  )
                ]
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 33, right: 20, top: 20, bottom: 16),
          actionsPadding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 24),
          actions: <Widget>[
            SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(button, 248, 45, 20, const Color(0xFFE86B02), const Color(0xFFFA9541)),
                ],
              )
            ),
          ],
        );
      },
    );
  }
