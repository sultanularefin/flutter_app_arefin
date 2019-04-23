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
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);
    //return Text(wordPair.asPascalCase);

    Widget _buildSuggestions() {

      // ListView is like FlatList of RN
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            return _buildRow(_suggestions[index]);
          });
    }



//  }



  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
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




