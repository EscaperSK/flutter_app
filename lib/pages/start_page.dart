import 'package:flutter/material.dart';
import '../icons_food_app.dart';
import '../components/search_bar.dart';
import '../components/slider_info.dart';
import '../components/slider_wraper.dart';

class StartPage extends StatefulWidget {
  StartPage(this.scrollController, {Key key}) : super(key: key);
  final ScrollController scrollController;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final kitchensSlider = SliderInfo(0, 4, () {});
  final stocksSlider = SliderInfo(0, 4, () {});
  final startAmountOfShopToLoad = 3;
  final extraAmountOfShopToLoad = 3;

  int amountOfShopsToLoad = 3;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      physics: BouncingScrollPhysics(),
      children: [
        MainTopBlock(),
        MainPoster('Доставка еды', 'во Владикавказе',
            'Найти заведение или позицию меню'),
        Container(
          margin: EdgeInsets.fromLTRB(16, 32, 16, 0),
          child: SliderWraperStful(kitchensSlider, KitchensTable()),
        ),
        StocksSliderBlock(stocksSlider),
        ShopsListBlock(3),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 113.0,
      height: 60.0,
      margin: EdgeInsets.fromLTRB(24, 22, 0, 22),
      child: Icon(
        Icons.work,
      ),
    );
  }
}

class UserTopButton extends StatefulWidget {
  UserTopButton({Key key}) : super(key: key);

  @override
  _UserTopButtonState createState() => _UserTopButtonState();
}

class _UserTopButtonState extends State<UserTopButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xfffa431c),
        ),
      ),
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.fromLTRB(0, 22, 24, 22),
      child: IconButton(
        icon: Icon(
          IconsFoodApp.user,
          color: Color(0xfffa431c),
          size: 18.0,
        ),
        onPressed: () {},
      ),
    );
  }
}

class MainTopBlock extends StatelessWidget {
  MainTopBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLogo(),
        UserTopButton(),
      ],
    );
  }
}

class MainPoster extends StatelessWidget {
  MainPoster(this.titleTxtBold, this.titleTxtReg, this.hintText, {Key key})
      : super(key: key);
  final String titleTxtBold;
  final String titleTxtReg;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7ABF44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleTxtBold,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  titleTxtReg,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(26, 32, 26, 35),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffE8E8E8)),
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            ),
            child: SearchBarStless(hintText),
          ),
        ],
      ),
    );
  }
}

class KitchensTable extends StatelessWidget {
  KitchensTable({Key key}) : super(key: key);
  final double margins = 8;
  final double w = 155;
  final double h = 78;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Container(
              margin: EdgeInsets.all(margins),
              width: w,
              height: h,
              color: Color(0xff000000),
            ),
            Container(
              margin: EdgeInsets.all(margins),
              width: w,
              height: h,
              color: Color(0xff000000),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              margin: EdgeInsets.all(margins),
              width: w,
              height: h,
              color: Color(0xff000000),
            ),
            Container(
              margin: EdgeInsets.all(margins),
              width: w,
              height: h,
              color: Color(0xff000000),
            ),
          ],
        ),
      ],
    );
  }
}

class StocksSliderBlock extends StatefulWidget {
  StocksSliderBlock(this.stocksSlider, {Key key}) : super(key: key);
  final SliderInfo stocksSlider;

  @override
  _StocksSliderBlockState createState() => _StocksSliderBlockState();
}

class _StocksSliderBlockState extends State<StocksSliderBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Акции',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              InkWell(
                child: Text(
                  'Смотреть все акции',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    color: Color(0xffFA431C),
                  ),
                ),
                highlightColor: Color(0x00),
                splashColor: Color(0x00),
                onTap: () {
                  ////////////////////////
                },
              ),
            ],
          ),
          SliderWraperStful(
            widget.stocksSlider,
            Container(
              height: 162,
              margin: EdgeInsets.only(top: 37, bottom: 11),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class ShopListTitle extends StatefulWidget {
  ShopListTitle({Key key}) : super(key: key);

  @override
  _ShopListTitleState createState() => _ShopListTitleState();
}

class _ShopListTitleState extends State<ShopListTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Список заведений',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        IconButton(
          padding: EdgeInsets.all(0),
          constraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 20,
          ),
          icon: Icon(
            IconsFoodApp.filter,
            size: 20,
            color: Color(0xff454545),
          ),
          onPressed: () {
            //////////////////
          },
        ),
      ],
    );
  }
}

class LoadedShopsColumn extends StatelessWidget {
  LoadedShopsColumn(this.n, {Key key}) : super(key: key);
  final list = <Widget>[];
  final int n;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < n; i++) {
      list.add(Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber,
              height: 191,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'Кафе “Лимончелло”',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                'Европейская / Кавказская / Японская кухна',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ));
    }
    return Column(children: list);
  }
}

class ButtonLoadMoreShops extends StatefulWidget {
  ButtonLoadMoreShops({Key key}) : super(key: key);

  @override
  _ButtonLoadMoreShopsState createState() => _ButtonLoadMoreShopsState();
}

class _ButtonLoadMoreShopsState extends State<ButtonLoadMoreShops> {
  int amountOfShopsToLoad = 3;
  int extraAmountOfShopToLoad = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 40),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff7ABF44)),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            'Загрузить ещё',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff7ABF44),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            amountOfShopsToLoad += extraAmountOfShopToLoad;
          });
        },
      ),
    );
  }
}

class ShopsListBlock extends StatelessWidget {
  ShopsListBlock(this.amountOfShopsToLoad, {Key key}) : super(key: key);
  final int amountOfShopsToLoad;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          ShopListTitle(),
          Container(
            padding: EdgeInsets.only(top: 37),
            child: LoadedShopsColumn(amountOfShopsToLoad),
          ),
          ButtonLoadMoreShops(),
        ],
      ),
    );
  }
}
