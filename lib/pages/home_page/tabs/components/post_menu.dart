import 'package:boxcom/models/enum/post_type.dart';
import 'package:boxcom/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget postDialog() {
  return SimpleDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    title: const Text("Post Options"),
    children: <Widget>[
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.logout),
            SizedBox(
              width: 10,
            ),
            Text("Se dessabonne")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.error_outline),
            SizedBox(
              width: 10,
            ),
            Text("Signale")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.download_outlined),
            SizedBox(
              width: 10,
            ),
            Text("Telecharge la photo")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.hide_source),
            SizedBox(
              width: 10,
            ),
            Text("Masque la publication")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.download_outlined),
            SizedBox(
              width: 10,
            ),
            Text("Telecharge la photo")
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {},
        child: Row(
          children: const [
            Icon(Icons.bookmark_border),
            SizedBox(
              width: 10,
            ),
            Text("Enregistrer la publication")
          ],
        ),
      )
    ],
  );
}



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
        ]);
  }
}



