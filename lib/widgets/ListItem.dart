import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/models/Movie.dart';
import 'package:the_movie_db/util/DateFormatter.dart';
import 'package:the_movie_db/util/ImagePath.dart';

import '../navigation_manager.dart';
import '../route_path.dart';

class ListItem extends StatelessWidget {
  final Movie item;

  const ListItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      item.title ?? 'NA',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      DateFormatter.formatDate(
                                          item.releaseDate),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // color: Colors.grey[100],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          item.originalLanguage.toUpperCase(),
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: (item.adult)
                                            ? Text('18+',
                                                style: TextStyle(fontSize: 12))
                                            : Text(''),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              'View More',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ]),
                      margin: EdgeInsets.all(10)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  getImagePath(item.posterPath),
                  height: 120,
                  width: 85,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Provider.of<NavigationManager>(context, listen: false)
            .push(RoutePath.homeDetails(item));
      },
    );
  }
}
