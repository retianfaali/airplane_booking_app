import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/seat_cubit.dart';
import '../../shared/theme.dart';

class SeatItem extends StatefulWidget {
  // STATUS: 0. Available, 1. Selected, 2. Unavailable

  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  State<SeatItem> createState() => _SeatItemState();
}

class _SeatItemState extends State<SeatItem> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(widget.id);

    backgroundColor() {
      if (!widget.isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!widget.isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              // fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (widget.isAvailable) {
          context.read<SeatCubit>().selectSeat(widget.id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
