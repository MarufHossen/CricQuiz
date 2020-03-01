import 'package:cricquiz/models/category.dart';
import 'package:cricquiz/ui/pages/leaderboard.dart';
import 'package:cricquiz/ui/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GameLevel extends StatelessWidget {
  final Category category;

  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  GameLevel({Key key, this.category}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final quizQuestionsProvider = Provider.of<QuizQuestionsProvider>(context);
    // if(quizQuestionsProvider.isLoading == true) quizQuestionsProvider.requestOnlineQuestions();
    return Scaffold(
        appBar: AppBar(
          title: Text(category.name),
          elevation: 0,
          backgroundColor: Color(0xff27ae60),
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Color(0xff27ae60)),
                height: 350,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Select a level to start the quiz",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: 20,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    int level = index+1;
    //Category category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => _categoryLevelPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white70,
      textColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.lock),
          SizedBox(
            height: 10,
          ),
          AutoSizeText(
            "Level " + level.toString(),
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  _categoryLevelPressed(BuildContext context, Category category) {
    category.id == 6
        ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => LeaderBoard()))
        : Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => QuizPage(
                  category: category,
                )));
  }
}
