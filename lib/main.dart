import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
//      title: 'Welcome to Flutter',
      title: 'Startup Name Generator',
      home: RandomWords(),


//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
//        body: Center(
//          child: Text('Hello World'),
//          child1: Text('Hello World'),
//          child2: Text('Hello World'),

//          child3: Text('Hello World'),
      // child: Text(wordPair.asPascalCase),
//          child: RandomWords(),


//        )
//      ,

    );
  }
}


class RandomWordsState extends State<RandomWords> {
  // TODO Add build() method
  //  @override
  //  Widget build(BuildContext context) {
  // final wordPair = WordPair.random();


  //  final _suggestions = <WordPair>[];
  //  final _biggerFont = const TextStyle(fontSize: 18.0);


  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();   // Add this line.
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);






  //return Text(wordPair.asPascalCase);

  Widget _buildSuggestions() {

    //debugPrint(_suggestions);
    //print(_biggerFont);

    // ListView is like FlatList of RN
    //    doc resource -->
    //    https://docs.flutter.io/flutter/widgets/ListView-class.html
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          // print('context ==> $context'); // context is not one item as in map(oneItem, index)
          print('i ==> $i');
          if (i.isOdd) {
            print('i is odd --> $i');
            print('divider() executed...');
            return Divider();
          } /*2*/


          // else{


          final index = i ~/ 2; /*3*/


          // when nothing is loaded before _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          if (index >= _suggestions.length) {


            final x = _suggestions.length;

            print('since index ($i) >= _suggestions.length($x)');
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/

            print('_suggestions ==> $_suggestions');

            print('_suggestions is List ==> ');
            print(_suggestions is List);

            print('_suggestions is Map ==>');
            print(_suggestions is Map);
          }

          // when _suggestions.length > = index


          print('_suggestions[index] ==>');



          print(_suggestions[index]);

          print('index: $index');


          return _buildRow(_suggestions[index]);

          //    }
        }
      // itemCount: litems.length,
      //  itemCount: 'i',

    );
  }

//  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // Add this line.
//    ------
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon( // Add the lines from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border, // same icon with diff. style, border and without border. depending on bool value.
        color: alreadySaved ? Colors.red : null,
      ), // ... to here.
      onTap: () {      // Add 9 lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },               // ... to here.
    );
  }

      //   old codes **Widget _buildRow** -------
/*
    print('pair: $pair');
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  */
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
//RandomWordsState createState() => new RandomWordsState();
}




