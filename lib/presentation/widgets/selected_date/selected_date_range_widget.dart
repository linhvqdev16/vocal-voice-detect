import 'package:base_flutter_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectedDateRangeWidget extends StatefulWidget{

  DateRangePickerView? dateRangePickerView;

  DateRangePickerSelectionMode? dateRangePickerSelectionMode;

  SelectedDateRangeWidget({Key? key, this.dateRangePickerView, this.dateRangePickerSelectionMode}) : super(key: key);

  @override
  _SelectedDateRangeWidget createState() => _SelectedDateRangeWidget();
}

class _SelectedDateRangeWidget extends State<SelectedDateRangeWidget>{

  @override
  Widget build(BuildContext context) => Container(
      child: SfDateRangePicker(
        view: widget.dateRangePickerView ?? DateRangePickerView.month,
        selectionMode: widget.dateRangePickerSelectionMode ?? DateRangePickerSelectionMode.single,
        startRangeSelectionColor: ColorCustom.atomicTangerine,
        endRangeSelectionColor: ColorCustom.atomicTangerine,
        rangeSelectionColor: ColorCustom.atomicTangerine.withOpacity(0.2),
        headerStyle: const DateRangePickerHeaderStyle(textAlign: TextAlign.center),
      ),
    );


}