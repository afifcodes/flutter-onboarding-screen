import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Inter'),
    home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  PageController _controller = PageController(initialPage: 0);

  _onPageViewChange(int page) {
    setState(() {
      index = page;
    });
  }

  Widget page(
      {String? imageUrl, String? title, String? desc, bool isEnd = false}) {
    return Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Image.asset(
              imageUrl!,
              height: 300,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              title!,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800),
            ),
            SizedBox(
              height: 12,
            ),
            Text(desc!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade500)),
            Spacer(),
            isEnd
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 48,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey),
                    ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: _onPageViewChange,
              physics: BouncingScrollPhysics(),
              children: [
                page(
                    imageUrl: 'assets/connected.png',
                    title: 'Stay in Touch',
                    desc: 'Reach out to anyone at anytime'),
                page(
                    imageUrl: 'assets/inspired.png',
                    title: 'Get Inspired',
                    desc: 'Get insight from anyone and anytime'),
                page(
                    isEnd: true,
                    imageUrl: 'assets/opinion.png',
                    title: 'Share your Opinion',
                    desc: 'Don\'t be shy to speak up\nBuild your confidence'),
              ],
            ),
            Container(
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: index == 0
                                ? Colors.blue
                                : Colors.grey.shade300),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Container(
                        height: 8,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: index == 1
                                ? Colors.blue
                                : Colors.grey.shade300),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Container(
                        height: 8,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: index == 2
                                ? Colors.blue
                                : Colors.grey.shade300),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 124,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
