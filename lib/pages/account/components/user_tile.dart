import 'package:boxcom/models/user_model.dart';
import 'package:boxcom/pages/account/components/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatefulWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> UserDetails(user: widget.user,)));
        
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(
            widget.user.photo!
          ),
        ),
        title: Text("${widget.user.name} ${widget.user.surname}"),
        subtitle: Text(widget.user.town),
        trailing: Text(widget.user.country),

      ),
    );
  }
}
