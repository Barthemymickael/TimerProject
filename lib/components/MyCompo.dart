
class  extends StatefulWidget {
  const ({Key? key, required this.title}) : super(key: key);
 
  static const String routeName = "/";
 
  final String title;
 
  @override
  _State createState() => _State();
}
 
/// // 1. After the page has been created, register it with the app routes
/// routes: <String, WidgetBuilder>{
///   .routeName: (BuildContext context) => (title: ""),
/// },
///
/// // 2. Then this could be used to navigate to the page.
/// Navigator.pushNamed(context, .routeName);
///
 
class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
 
  void _onFloatingActionButtonPressed() {
  }
}