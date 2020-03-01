import 'package:cricquiz/utils/constants.dart';
import 'package:http/http.dart' as http;

class LeaderBoardRequest{
  Future<http.Response> getWebLeaderboard()async{
    var url = ApiUrl+"leaderboards";
    final response = http.get(url);
    return response;
  }
  Future<http.Response> updateScoreLeaderboard(var nameId,int score)async{
    var url = ApiUrl+"leaderboards/store";
    var parameter = '{"name_id": $nameId, "total_points": $score}';
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(url, body: parameter,headers: headers);
    return response;
  }

}