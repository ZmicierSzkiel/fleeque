import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fleeque/core_ui/constants.dart';
import 'package:fleeque/presentation/main_screen/influencers/bloc/influencers_bloc.dart';

class InfluencerDropdownButton extends StatelessWidget {
  final String labelText;
  final List<String> valueList;

  const InfluencerDropdownButton({
    super.key,
    required this.valueList,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencersBloc(),
      child: BlocBuilder<InfluencersBloc, InfluencersState>(
        builder: (context, state) {
          return Column(
            children: [
              InputDecorator(
                decoration: InputDecoration(
                  labelText: labelText.toUpperCase(),
                  labelStyle: AppFonts.mediumFontPrefsWhite,
                  prefix: const Divider(
                    color: AppColors.primaryColor,
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: state.filterSelectedValue ?? valueList[0],
                  elevation: 10,
                  icon: const Visibility(
                    visible: false,
                    child: Icon(Icons.arrow_downward),
                  ),
                  isExpanded: true,
                  dropdownColor: AppColors.textPrimaryColor,
                  items: valueList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: AppFonts.mediumFontPrefsWhiteLink,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    BlocProvider.of<InfluencersBloc>(context).add(
                      FilterValueChangedEvent(value),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
