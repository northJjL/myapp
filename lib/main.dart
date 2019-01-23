import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());
/*—————————————————————————————显示选中条目列表—————————————————————————*/
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shoppingList',
      home: ShoppingList(
        product: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}

class Product{
  const Product({this.name});
  final String name;
}
//ShoppingListItem
//ShoppingList
//_ShoppingListState
class ShoppingList extends StatefulWidget{
  ShoppingList({this.product ,Key key}) : super(key:key);
  final List<Product> product;
  createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList>{
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product ,bool isCart){
    setState(() {
      if(isCart){
        _shoppingCart.add(product);
      }else{
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shoppingList'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.product.map((Product product){
          return ShoppingListItem(
            product: product,
            callback: _handleCartChanged,
            inCart: _shoppingCart.contains(product),
          );
        }).toList(),
      ),
    );
  }
}

typedef void CartChangedCallback(Product product ,bool isCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({Product product , this.inCart,this.callback ,})
  : product = product ,super(key :new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback callback;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        callback(product ,!inCart);
      },
      leading:  new CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name ,
      style: _getTextStyle(context),),
    );
  }
}

/*—————————————————————————————常用布局widgets—————————————————————————*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'title',
        home: Scaffold(
          appBar: AppBar(
            title: Text('title'),
          ),
          body: card,
        ));
  }
}
var card = new SizedBox(
  height: 210.0,
  child: new Card(
    child: new Column(
      children: [
        new ListTile(
          title: new Text('1625 Main Street',
              style: new TextStyle(fontWeight: FontWeight.w500)),
          subtitle: new Text('My City, CA 99984'),
          leading: new Icon(
            Icons.restaurant_menu,
            color: Colors.blue[500],
          ),
        ),
        new Divider(),
        new ListTile(
          title: new Text('(408) 555-1212',
              style: new TextStyle(fontWeight: FontWeight.w500)),
          leading: new Icon(
            Icons.contact_phone,
            color: Colors.blue[500],
          ),
        ),
        new ListTile(
          title: new Text('costa@example.com'),
          leading: new Icon(
            Icons.contact_mail,
            color: Colors.blue[500],
          ),
        ),
      ],
    ),
  ),
);


var stack = Stack(
  alignment: const Alignment(0.6, 0.6),
  children: [
    CircleAvatar(
      backgroundImage: AssetImage('images/pic3.jpg'),
      radius: 100.0,
    ),
    Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Text(
        'Mia B',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Container(
      child: Text(
        'Mia B',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.amberAccent,
        ),
      ),
    ),
  ],
);

List<Widget> list = <Widget>[
  ListTile(
    title: Text('456'),
  ),
];

//buildGrid
//_buildGridTileList

List<Widget> _buildGridTileList(int length) {
  return List<Widget>.generate(length, (int index) {
    return Container(
      child: Image.asset('images/pic${1}.jpg'), //index +
//    child: Text('images/pic${index + 1}.jpg'),
    );
  });
}

Widget buildGrid() {
  return GridView.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    padding: EdgeInsets.all(4.0),
    children: _buildGridTileList(30),
  );
}*/

/*List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(
  count,
  (int index) =>
  Container(child: Image.asset('images/pic${1}.jpg')));
}

Widget buildGrid() {
  return GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(30));
}*/

/*—————————————————————————————页面布局2—————————————————————————*/
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Strawberry Pavlova Recipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var titleText = Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30.0,
        ),
      ),
    );

    var subTitle = Text(
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
      ),
    );

    Widget ratings = Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    // DefaultTextStyle.merge allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    Widget leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: ListView(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    Widget mainImage = Expanded(
      child: Image.asset(
        'images/pavlova.jpg',
        fit: BoxFit.cover,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 600.0,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 440.0,
                  child: leftColumn,
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

/*—————————————————————————————页面布局1 （添加点击事件）—————————————————————————*/
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color ,Icons.call ,'CALL'),
          _buildButtonColumn(color ,Icons.near_me ,'ROUTE'),
          _buildButtonColumn(color ,Icons.share ,'SHARE'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

Widget textSection = Container(
  padding: const EdgeInsets.all(32.0),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

Widget titleSection = Container(
  padding: EdgeInsets.all(32.0),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Oeschinen Lake Campground'),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      ParentWidget(),
    ],
  ),
);

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  int _favoriteCount = 40;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      if(_active){
        _favoriteCount -= 1;
      }else{
        _favoriteCount += 1;
      }
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new FavoriteWidget(
        active: _active,
        favoriteCount: _favoriteCount,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  FavoriteWidget({Key key, this.active: false, this.favoriteCount:40 , @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;
  final int favoriteCount;
  createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
//  bool _isFavorited = true;

  void _toggleFavorite(){
    widget.onChanged(!widget.active);
//    setState(() {
//      if(_isFavorited){
//        _favoriteCount -= 1;
//      }else{
//        _favoriteCount += 1;
//      }
//      _isFavorited = !_isFavorited;
//    });
  }

  @override
  Widget build(BuildContext context) {
    int _favoriteCount = widget.favoriteCount;
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(icon: widget.active ?Icon(Icons.star) :Icon(Icons.star_border),
//          IconButton(icon: _isFavorited ?Icon(Icons.star) :Icon(Icons.star_border),
            color: Colors.red[500] ,
          onPressed: _toggleFavorite,),
          SizedBox(
            width: 18.0,
            child: Text('$_favoriteCount'),
          ),
        ],
      ),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String str) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          str,
          style: TextStyle(fontWeight: FontWeight.w400, color: color),
        ),
      ),
    ],
  );
}*/

/*—————————————————————————————选中列表跳转—————————————————————————*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.white),
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
//          child: new Text('Hello World'),
          child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
        ),
      ),
    );
  }
}*/

/*class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final   tiles = _saved.map(
              (pair){
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
              },
          );

          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite :Icons.favorite_border ,
        color: alreadySaved ? Colors.red : null,
      ),
        onTap: (){
         setState(() {
           if(alreadySaved){
             _saved.remove(pair);
           }else{
             _saved.add(pair);
           }
         });
        },
      //
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
}*/
