import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/widgets.dart';
import '../../edit.dart';

class EditQuantity extends StatelessWidget {
  const EditQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      buildWhen: (previous, current) => previous.quantity != current.quantity,
      builder: (context, state) {
        return AddSubtractCard(
          title: 'Edit quantity',
          value: state.quantity.value,
          maxValue: state.product.quantity,
          onSubtract: () {
            context
                .read<EditCubit>()
                .quantityChanged(value: state.quantity.value - 1);
          },
          onAdd: () {
            context
                .read<EditCubit>()
                .quantityChanged(value: state.quantity.value + 1);
          },
          onTap: () async {
            await showInputDialog(
              context: context,
              initValue: state.quantity.value,
              maxValue: state.product.quantity,
            );
          },
        );
      },
    );
  }

  Future<void> showInputDialog({
    required BuildContext context,
    required int initValue,
    required int maxValue,
  }) async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) => NumberInputDialog(
        title: 'Quantity',
        initValue: initValue.toDouble(),
      ),
    );

    if (value != null) {
      // ignore: use_build_context_synchronously
      context
          .read<EditCubit>()
          .quantityChanged(value: value.toInt().clamp(0, maxValue));
    }
  }
}
