import 'package:boxcom/data/enterprises.dart';
import 'package:boxcom/data/users.dart';
import 'package:boxcom/models/enterprise_model.dart';
import 'package:boxcom/pages/home_page/tabs/components/web_view.dart';
import 'package:boxcom/pages/home_page/tabs/home_tab/components/post_view_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/enterprise_followers.dart';
import 'components/enterprise_partners.dart';

class EnterpriseDetail extends StatefulWidget {
  const EnterpriseDetail({Key? key, required this.enterprise})
      : super(key: key);
  final Enterprise enterprise;

  @override
  _EnterpriseDetailState createState() => _EnterpriseDetailState();
}

class _EnterpriseDetailState extends State<EnterpriseDetail> {
  var _isSubscribed = false;
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(controller: _trackingScrollController, slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 10,
            backgroundColor: Theme.of(context).bottomAppBarColor,

            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
            title: Text(
              widget.enterprise.name,
              style: const TextStyle(),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 05.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.enterprise.image),
                      radius: 55.0,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.enterprise.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.enterprise.enterpriseSector,
                          style: const TextStyle(
                               fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                widget.enterprise.ville,
                                style: const TextStyle(
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,

                                size: 20,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                widget.enterprise.telephone,
                                style: const TextStyle(
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "${widget.enterprise.openHour} - ${widget.enterprise.closingHour} ",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.language_outlined,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewPage(website: widget.enterprise.website,
                                            )));
                                },
                                child: Text(
                                  widget.enterprise.website,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),


                      Wrap(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isSubscribed = !_isSubscribed;
                              });


                            },
                            child: _isSubscribed
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: LinearGradient(colors: [
                                        Colors.cyanAccent,
                                        Theme.of(context).primaryColor
                                      ]),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!.subscribe,
                                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                    ))
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: const LinearGradient(colors: [
                                        Colors.black26,
                                        Colors.grey
                                      ]),
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!.unsubscribe,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    )),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: Text(
                  widget.enterprise.description,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const EnterpriseFollowers()));

                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children:  [
                             Text(
                            users.length.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.members,
                              style: const TextStyle(
                                 fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> const EnterprisePartners()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                             Text(
                             enterprises.length.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                                AppLocalizations.of(context)!.partners,
                              style: const TextStyle(
                                 fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children:  [
                        Text(
                        widget.enterprise.myPosts.length.toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        const Text(
                          "posts",
                          style: TextStyle( fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostHome(post:widget.enterprise.myPosts[index],);
              },
              childCount: widget.enterprise.myPosts.length,
            ),
          )
        ]),
      ),
    );
  }
}
