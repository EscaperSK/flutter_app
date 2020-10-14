import 'package:flutter/material.dart';
import './components/icon_with_badge.dart';
import './icons_food_app.dart';
import 'pages/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        textTheme: TextTheme(
          subtitle1: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff454545),
          ),
          caption: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xff454545),
          ),
          subtitle2: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 14,
            color: Color(0xff454545),
          ),
          headline6: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            height: 2,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 24.0,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 14.0,
            color: Color(0xff454545),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrentPage(),
    );
  }
}

class CurrentPage extends StatefulWidget {
  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  Widget currentPage;
  int currentPageIndex = 0;
  int amountOfItemsInTheCart = 100;
  ScrollController scrollController = ScrollController();

  void onNavTap(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Container bottomNavBar() => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xffDEDEDE)),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPageIndex,
          selectedItemColor: Color(0xff7ABF44),
          unselectedItemColor: Color(0xff7D7D7D),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          showUnselectedLabels: true,
          onTap: onNavTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(IconsFoodApp.waiter),
              label: 'Заведения',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsFoodApp.heart),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: IconWithBadgeStless(
                  IconsFoodApp.cart, amountOfItemsInTheCart),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsFoodApp.search),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsFoodApp.more),
              label: 'Ещё',
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        currentPage = StartPage(scrollController);
        break;
      case 1:
        currentPage = Center(child: Text('Page 1'));
        break;
      case 2:
        currentPage = Center(child: Text('Page 2'));
        break;
      case 3:
        currentPage = Center(child: Text('Page 3'));
        break;
      case 4:
        currentPage = Center(child: Text('Page 4'));
        break;
      default:
        currentPage = Center(child: Text('Error'));
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
