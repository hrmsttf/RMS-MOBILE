import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:photo_view/photo_view.dart';
import 'package:merchandising/api/FMapi/merc_leave_details.dart';
import 'package:flutter/cupertino.dart';

int leave;

class ResponsetoLeave extends StatefulWidget {
  @override
  _ResponsetoLeaveState createState() => _ResponsetoLeaveState();
}

class _ResponsetoLeaveState extends State<ResponsetoLeave> {
  bool isApiCallProcess = false;
  String accepted = "2";
  String rejected = "1";
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Leave Response',
                style: TextStyle(color: orange),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(children: [
          BackGround(),
          ListView.builder(
              itemCount: leavedataResponse.reasons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    leave = index;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => leaveresult()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Reason : ',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: AutoSizeText(
                                '${leavedataResponse.reasons[index]}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Leave Type:',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                '${leavedataResponse.leavetypes[index]}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Number of days :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                leavedataResponse.totnoofdays[index]
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Employee :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(leavedataResponse.empname[index]
                                .toString()),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Status :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                leavedataResponse.isleaveaccepted[index] == accepted
                                    ? 'Accepted'
                                    : leavedataResponse.isleaverejected[index] == rejected
                                    ? 'Rejected'
                                    : 'Pending',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            Spacer(),
                            Icon(
                              leavedataResponse.isleaveaccepted[index] == accepted
                                  ? CupertinoIcons.check_mark_circled_solid
                                  : leavedataResponse.isleaverejected[index] == rejected ? CupertinoIcons
                                  .clear_circled_solid : CupertinoIcons
                                  .arrow_up_arrow_down_circle_fill,
                              color: leavedataResponse.isleaveaccepted[index] == accepted
                                  ? Colors.green
                                  : leavedataResponse.isleaverejected[index] == rejected ? Colors.red : Colors.grey,
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              }),
        ]));
  }
}

class leaveresult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          "Leave Response",
          style: TextStyle(color: orange),
        ),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.3,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Reason : ',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: AutoSizeText(
                              leavedataResponse.reasons[leave],
                              style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Leave Type:',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              leavedataResponse.leavetypes[leave]
                                  .toString(),
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('total number of days',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          Text(
                              leavedataResponse.totnoofdays[leave]
                                  .toString(),
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Employee name :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(leavedataResponse.empname[leave]
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Employee ID :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(leavedataResponse
                              .empid[leave]
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Start Date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(leavedataResponse.Startdates[leave]),
                        ],
                      ),
                      Row(
                        children: [
                          Text('End date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(leavedataResponse.enddates[leave]
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Requested on :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(leavedataResponse.requestedon[leave]
                              .toString()
                              .substring(0, 10)),
                        ],
                      ),
                      leavedataResponse.leavetypes[leave]
                                  .toString() ==
                              "Sick_Leave"
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Supported Documents :',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                VeiwImage()));
                                  },
                                  child: Container(
                                    width: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(child: Text("Veiw",style: TextStyle(color: Colors.white),)),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ResponsetoLeave()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Reject Leave",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ResponsetoLeave()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Accept Leave",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VeiwImage extends StatelessWidget {
  String url =
      "https://rms2.rhapsody.ae/leavedocuments/${leavedataResponse.supportdocs[leavedataResponse.supportdocs.length - 1 - leave].toString()}";
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(
        url,
      ),
    );
  }
}
