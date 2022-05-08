import 'package:flutter/material.dart';
import 'package:github_api_dome/Model/Activity.dart';

class CardEvent extends StatelessWidget {
  final Event event;
  const CardEvent(this.event, {Key? key}) : super(key: key);
  void openProject(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openProject(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(event.actor?.avatarUrl ?? ''),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Wrap(children: <Widget>[
                  Text(event.actor?.login ?? '',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    event.type ?? '',
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ]),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  event.repo?.name ?? '',
                  style: TextStyle(fontSize: 16, color: Colors.blue[900]),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
