import 'package:flutter/material.dart';
import 'package:free_news/cubit/news_cubit.dart';

Widget buildItem(results,context) => Container(
      //this context for this line as he required a context=> style:Theme.of(context).textTheme.bodyLarge
      padding: EdgeInsets.all(10),
      width: 100,
      height: 150,
      // color: Colors.grey,
      child: Row(
        children: [
          Container(
            height: 120,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${results["image_url"]}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          /* Image.network(
          width: 70,
          height: 130,
          '${article["urlToImage"]}',
      ),*/
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                      '${results["content"]}',
                      style:
                      Theme.of(context).textTheme.bodyLarge,
                /*      TextStyle(
                        // overflow:TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black
                      )*/

                  ),
                ),
                SizedBox(height: 10),
                Text(
                  // publishedAt  description content author
                  '${results["pubDate"]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
