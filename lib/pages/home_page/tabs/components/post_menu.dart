import 'package:boxcom/models/enum/post_type.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PopUpMenuImage extends StatelessWidget {
  const PopUpMenuImage({Key? key, required this.post,required this.color}) : super(key: key);

  final Post post;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

       
        icon: Icon(Icons.more_vert, color: color),
        itemBuilder: (_) => [
          PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children:  [
                    const Icon(
                      Icons.logout,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(AppLocalizations.of(context)!.unsubscribe),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: .75,
                  height: 0.75,
                )
              ],
            ),
          ),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.error_outline,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.signal)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.download_outlined,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.downloadPhoto)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.hide_source,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.maskPost)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),
          if (post.postType == PostType.product)
            PopupMenuItem(
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const Icon(
                          Icons.bookmark_border,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.saveProduct)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: .75,
                      height: 0.75,
                    )
                  ],
                )),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.bookmark_border,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.savePost)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )
          ),
          PopupMenuItem(
              child: InkWell(
                onTap: (){
                  showInSnackBar(AppLocalizations.of(context)!.addedToFavouriteSuccess, context);
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const Icon(
                          Icons.add,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.addToFavourite)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: .75,
                      height: 0.75,
                    )
                  ],
                ),
              )),
        ]);
  }
}




class PopUpMenuVideo extends StatelessWidget {
  const PopUpMenuVideo({Key? key, required this.post, required this.color}) : super(key: key);

  final Post post;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: color,
        ),
        itemBuilder: (_) => [
          PopupMenuItem(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.logout,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(AppLocalizations.of(context)!.unsubscribe),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: .75,
                  height: 0.75,
                )
              ],
            ),
          ),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.signal)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.hide_source,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.maskPost)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),
          if (post.postType == PostType.product)
            PopupMenuItem(
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const Icon(
                          Icons.bookmark_border,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.saveProduct)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: .75,
                      height: 0.75,
                      color: Colors.black26,
                    )
                  ],
                )),
          PopupMenuItem(
              child: Column(
                children: [
                  Row(
                    children:  [
                      const Icon(
                        Icons.bookmark_border,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(AppLocalizations.of(context)!.savePost)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: .75,
                    height: 0.75,
                  )
                ],
              )),

          PopupMenuItem(
              child: InkWell(
                onTap: (){
                  showInSnackBar("Added to Favourite Successfully", context);
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const Icon(
                          Icons.add,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.addToFavourite)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: .75,
                      height: 0.75,
                    )
                  ],
                ),
              )),

        ]
    );
  }
}

void showInSnackBar(String value, context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: Colors.black54,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        behavior: SnackBarBehavior.floating,

        elevation: 10,
      )
  );
}



