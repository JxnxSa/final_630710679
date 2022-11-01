import 'package:final_630710679/helper.dart';
import 'package:final_630710679/models/team_item.dart';
import 'package:final_630710679/services/api.dart';
import 'package:flutter/material.dart';
import 'package:final_630710679/pages/view_result_page.dart';

class TeamListPage extends StatefulWidget {
  const TeamListPage({Key? key}) : super(key: key);

  @override
  State<TeamListPage> createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  List<TeamItem>? _teamList;
  var _isLoading = false;
  String? _errMessage;

  @override
  void initState() {
    super.initState();
    _fetchTeamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  width: 280.0,
                  height: 100.0,
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  if (_teamList != null)
                    ListView.builder(
                      itemBuilder: _buildListItem,
                      itemCount: _teamList!.length,
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _handleClickButtonView();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white70,
                      ),
                      child: Text(
                        'VIEW RESULT',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA00000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _handleClickButtonView(){

  }

  void _fetchTeamData() async {
    setState(() {
      //_teamList = null;
      _isLoading = true;
    });

    try {
      var data = await Api().fetch('');
      setState(() {
        _teamList =
            data.map<TeamItem>((item) => TeamItem.fromJson(item)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    var teamList = _teamList![index];
    var apiBaseUrl = 'http://103.74.252.66:8888';
    String urlImages = apiBaseUrl + teamList.flagImage;
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(
                  urlImages,
                  width: 120.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  ${teamList.team}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '  GROUP ${teamList.group}',
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {

              showMyDialog(context, 'SUCCESS', 'You voted ${teamList.team}. Data saved successfully.');
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFA00000),
            ),
            child: Text(
              'VOTE',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
