import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:interview/first.dart';

void main() {
  runApp(MaterialApp(
    home: fit(),
    builder: EasyLoading.init(),
  ));
}

class fit extends StatefulWidget {
  const fit({Key? key}) : super(key: key);

  @override
  State<fit> createState() => _fitState();
}

class _fitState extends State<fit> {
  bool status = false;
  jsonview? mm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forget();

  }

  Future<void> forget() async {
    var url = Uri.parse('http://rickandmortyapi.com/api/character');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var reus = jsonDecode(response.body);
    mm = jsonview.fromJson(reus);
    status = true;
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: status
            ? ListView.builder(
                itemCount: mm!.results!.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return first(mm,index);
                        },));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        "${mm!.results![index].image}"),
                                  )),
                                ),
                                Container(
                                  child: Text(
                                    "${mm!.results![index].id}",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${mm!.results![index].name}",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${mm!.results![index].status}",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${mm!.results![index].created}",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator())
     );
  }
}

class jsonview {
  Info? info;
  List<Results>? results;

  jsonview({this.info, this.results});

  jsonview.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  dynamic count;
  dynamic pages;
  String? next;
  Null? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class Results {
  dynamic id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<dynamic>? episode;
  String? url;
  String? created;

  Results(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
    json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    location =
    json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    if (this.origin != null) {
      data['origin'] = this.origin!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['image'] = this.image;
    data['episode'] = this.episode;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
