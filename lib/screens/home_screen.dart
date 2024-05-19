import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.isDarkTheme,
    required this.setDarkTheme,
  });

  final String title;
  final bool isDarkTheme;
  final Function(bool) setDarkTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementZero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              widget.title,
              style: TextStyle(
                color:
                    widget.isDarkTheme ? Colors.white : const Color(0xFF96d26c),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Switch(
              inactiveThumbColor: const Color(0xFF96d26c),
              thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return const Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  );
                }
                return const Icon(
                  Icons.sunny,
                  color: Color(0xFF96d26c),
                );
              }),
              activeTrackColor: const Color(0xFF96d26c),
              activeColor: Colors.white,
              value: widget.isDarkTheme,
              onChanged: (value) {
                widget.setDarkTheme(value);
              },
            )
          ],
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: _incrementZero,
            icon: Icon(
              Icons.refresh_rounded,
              color:
                  widget.isDarkTheme ? Colors.white : const Color(0xFF96d26c),
              size: 30,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFf2ea5b).withOpacity(0.5),
                  const Color(0xFF96d26c).withOpacity(0.5),
                  const Color(0xFF01a683).withOpacity(0.5),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            padding: const EdgeInsets.only(top: 20),
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Количество нажатий:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height / 2,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: height / 2,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFFf2ea5b),
                              Color(0xFF96d26c),
                              Color(0xFF01a683),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 250,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}