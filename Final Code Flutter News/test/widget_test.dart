class drawerWidget extends StatefulWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  _drawerWidgetState createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Consumer<DarkThemeProvider>(
            builder: (context, themeProvider, _) {
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: themeProvider.darkTheme == false
                      ? Colors.blue
                      : Colors.grey,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                    ),
                  ],
                ),
              );
            },
          ),
          // ...
        ],
      ),
    );
  }
}
