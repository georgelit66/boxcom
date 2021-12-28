import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EnterpriseSort extends StatelessWidget {
  const EnterpriseSort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.filter_list),
        itemBuilder: (_) =>[
          PopupMenuItem(
              child: Text(AppLocalizations.of(context)!.retail)
          ),
          PopupMenuItem(
              child: Text(AppLocalizations.of(context)!.beauty)
          ),
          PopupMenuItem(
              child: Text(AppLocalizations.of(context)!.technology)
          ),
          PopupMenuItem(
              child: Text(AppLocalizations.of(context)!.construction)
          ),
          PopupMenuItem(
              child: Text(AppLocalizations.of(context)!.transport)
          ),

        ]
    );
  }
}

