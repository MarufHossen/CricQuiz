import 'package:cricquiz/models/leaderboard_model.dart';
import 'package:cricquiz/requests/LeaderBoardRequest.dart';
import 'package:flutter/cupertino.dart';

class LeaderboardProvider with ChangeNotifier {
  List<LeaderboardDatum> _leaderboardData;
  bool _isLoading = true;

  List<LeaderboardDatum> get leaderboardData => _leaderboardData;
  bool get isLoading => _isLoading;

  Future<bool> requestOnlineLeaderboard() async {
    LeaderBoardRequest().getWebLeaderboard().then((data) async {
      if (data.statusCode == 200) {
        print("L-PROVIDER-> Data success: 200");
        final leaderBoardModel = leaderBoardModelFromJson(data.body);
        _leaderboardData = leaderBoardModel.data;
        setLoading(false);

        // var isStored =
        //     await SharedPreferenceHelper().store("leaderBoard", data.body);
        // isStored
        //     ? print("Leaderboard Stored Successfully")
        //     : print(
        //         "L.Board Not Stored.\nPlease Check line 17 of L.BoardProvider");
      }
    });
    return true;
  }

  Future<bool> requestUpdateScoreLeaderboard(var score) async {
    // SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    //sharedPreference.setInt("nameId", 14);
    //int nameId = int.parse(SharedPreferenceHelper().read("nameId"));
    //print(nameId);
    var nameId = 1;

    LeaderBoardRequest().getWebLeaderboard().then((data) {
      if (data.statusCode == 200) {
        final lbPreModel = leaderBoardModelFromJson(data.body);
        List<LeaderboardDatum> lbPreModelData = lbPreModel.data;
        var currentScore = 0;
        for (final data in lbPreModelData) {
          print(data);

          if (data.nameId == nameId) {
            currentScore = data.totalPoints;
            break;
          }
        }
        var totalScore = currentScore + score;
        print("Total Score===>" + totalScore.toString());
        LeaderBoardRequest()
            .updateScoreLeaderboard(nameId, totalScore)
            .then((data) {
          print(data.body.toString());
          if (data.statusCode == 200) {
            print("Successfully score updated");
            final leaderBoardModel = leaderBoardModelFromJson(data.body);
            _leaderboardData = leaderBoardModel.data;
            setLoading(false);
          } else
            print("Something Went Wrong code 500 Lboard Provider");
        });
      }
    });

    return true;
  }

  void setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }
}
