import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/history_dm.dart';
import '../../../../resource/app_colors.dart';
import '../../../../services/firestore_database/history_service.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({required this.history, super.key});

  final HistoryDm history;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(history),
      confirmDismiss: (direction) async => HistoryService.delete(history.id),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.appPadding),
        decoration: const BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: AppColors.userTileShadow,
              offset: Offset(4, 4),
              spreadRadius: -6,
              blurRadius: 14,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              history.image,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: AppConstants.appPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount: ${history.amount}/-Rs',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Date: ${history.time}',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    history.desc,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
