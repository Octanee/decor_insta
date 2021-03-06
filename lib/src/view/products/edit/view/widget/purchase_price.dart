import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../extensions/extension.dart';
import '../../../../../widgets/widgets.dart';
import '../../edit.dart';

class EditPurchasePrice extends StatelessWidget {
  const EditPurchasePrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      buildWhen: (previous, current) =>
          previous.purchasePrice != current.purchasePrice,
      builder: (context, state) {
        return EditCard(
          title: 'Purchase price',
          value: '${state.purchasePrice.value.toPrice()} PLN',
          isValid: state.purchasePrice.valid,
          onTap: () async {
            await showInputDialog(
              context: context,
              initValue: state.purchasePrice.value,
            );
          },
        );
      },
    );
  }

  Future<void> showInputDialog({
    required BuildContext context,
    required double initValue,
  }) async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) => NumberInputDialog(
        title: 'Purchase price',
        initValue: initValue,
      ),
    );

    if (value != null) {
      // ignore: use_build_context_synchronously
      context.read<EditCubit>().purchasePriceChanged(value: value);
    }
  }
}
