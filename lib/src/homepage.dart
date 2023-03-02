import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:flutter_web_test/src/website_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _urlCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Website Apk Demo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 18.0, right: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  height: 45,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _urlCon,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black,
                          autofocus: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4.0),
                            hintText: 'eg. www.google.com',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  bool validURL = isURL(_urlCon.text);
                  if(validURL) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => WebsiteView(url: _urlCon.text,),
                        transitionDuration: const Duration(seconds: 0)
                      ),
                    );
                  } else {
                    showMessage('Invalid url', context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Check Website'),
              )
            ],
          ),
        )
      ),
    );
  }

  showMessage(msg, context) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}