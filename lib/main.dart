import 'dart:html';
import 'package:flutter/material.dart';
import 'package:responsive_flutter_application/Input.dart';
import 'package:responsive_framework/responsive_framework.dart';

final _formkey = GlobalKey<FormState>();
bool light = true;
bool check = false;
ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 250, 250, 250),
  focusColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromARGB(255, 83, 84, 85),
  focusColor: Colors.purple,
  accentColor: Colors.purple,
);

void main() => runApp(MaterialApp(
    builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.resize(640, name: TABLET),
              ResponsiveBreakpoint.resize(800, name: DESKTOP),
              ResponsiveBreakpoint.resize(1700, name: 'XL'),
            ]),
    debugShowCheckedModeBanner: false,
    home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: MaterialApp(
      theme: light ? _lightTheme : _darkTheme,
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Switch(
                  value: light,
                  onChanged: (toggle) {
                    setState(() {
                      light = toggle;
                    });
                  }),
            ),
            Container(
              child: Form(
                child: Column(
                  children: [
                    Input(((value) {
                      if (value!.isEmpty || value == null)
                        return ('enter a company name');
                      else
                        return null;
                    }), _width * 0.95, 1, "your company", "company name",
                        Icon(Icons.apartment), light, _lightTheme, _darkTheme),
                    ResponsiveRowColumn(
                      rowPadding: EdgeInsets.fromLTRB(30, 15, 30, 30),
                      rowMainAxisAlignment: MainAxisAlignment.center,
                      layout:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Input(((value) {
                            if (value!.isEmpty || value == null)
                              return ('enter a name');
                            else
                              return null;
                          }),
                              _width * 0.95,
                              1,
                              "your name",
                              "client name",
                              Icon(Icons.person),
                              light,
                              _lightTheme,
                              _darkTheme),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Input(((value) {
                            if (value!.isEmpty ||
                                value == null ||
                                RegExp(r'^[0-9]+$').hasMatch(value))
                              return ('enter an number');
                            else
                              return null;
                          }),
                              _width * 0.95,
                              1,
                              "(999) 999-9999",
                              "phone number",
                              Icon(Icons.phone),
                              light,
                              _lightTheme,
                              _darkTheme),
                        )
                      ],
                    ),
                    ResponsiveRowColumn(
                      rowPadding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      layout:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 2,
                          child: Input(((value) {
                            if (value!.isEmpty ||
                                value == null ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value))
                              return ('email is wrong');
                            else
                              return null;
                          }),
                              _width * 0.95,
                              1,
                              "Email Address",
                              "Email Address",
                              Icon(Icons.email),
                              light,
                              _lightTheme,
                              _darkTheme),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Input(((value) {
                            if (value!.isEmpty ||
                                value == null ||
                                RegExp(r'^[0-9]+$').hasMatch(value))
                              return ('enter an pin');
                            else
                              return null;
                          }),
                              _width * 0.95,
                              1,
                              "pin code",
                              "pin code",
                              Icon(Icons.pin_drop),
                              light,
                              _lightTheme,
                              _darkTheme),
                        ),
                      ],
                    ),
                    Input(((value) {
                      if (value!.isEmpty || value == null)
                        return ('enter an address');
                      else
                        return null;
                    }), _width * 0.95, 3, "your address", "address", Icon(null),
                        light, _lightTheme, _darkTheme),
                    ResponsiveRowColumn(
                      rowPadding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      layout:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      children: [
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Input(((value) {
                            if (value!.isEmpty || value == null)
                              return ('enter a city');
                            else
                              return null;
                          }),
                              _width * 0.95,
                              1,
                              "your city/town",
                              "city",
                              Icon(Icons.location_city),
                              light,
                              _lightTheme,
                              _darkTheme),
                        ),
                        ResponsiveRowColumnItem(
                          rowFlex: 1,
                          child: Input(((value) {
                            if (value!.isEmpty || value == null)
                              return ('enter a state');
                            else
                              return null;
                          }), _width * 0.95, 1, "your state", "state",
                              Icon(Icons.flag), light, _lightTheme, _darkTheme),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 25, 0, 0),
                      child: Row(
                        children: [
                          Text("same is Billing addresss",
                              style: TextStyle(fontSize: 20)),
                          Checkbox(
                              value: check,
                              activeColor: light
                                  ? _lightTheme.focusColor
                                  : _darkTheme.focusColor,
                              onChanged: ((value) => setState(() {
                                    check = !check;
                                  }))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Visibility(
                        child: Input(((value) {
                          if (value!.isEmpty || value == null)
                            return ('enter a billing address');
                          else
                            return null;
                        }),
                            _width * 0.95,
                            3,
                            "enter billing address",
                            "billing address",
                            Icon(null),
                            light,
                            _lightTheme,
                            _darkTheme),
                        visible: check,
                      ),
                    )
                  ],
                ),
                key: _formkey,
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 200,
                  child: Row(children: [
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: ElevatedButton(
                          onPressed: () =>
                              {if (_formkey.currentState!.validate()) {}},
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                          child: Text("prev")),
                    ),
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: ElevatedButton(
                        onPressed: () =>
                            {if (_formkey.currentState!.validate()) {}},
                        style: ElevatedButton.styleFrom(
                            primary: light
                                ? _lightTheme.focusColor
                                : _darkTheme.focusColor),
                        child: Text("Next"),
                      ),
                    )
                  ]),
                ))
          ],
        ),
      ),
    ));
  }
}
