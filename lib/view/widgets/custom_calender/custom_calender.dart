import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum WeekStartFrom {
  sunday,

  monday,
}

class CustomCalender extends StatefulWidget {
  final WeekStartFrom? weekStartFrom;
  final Function(DateTime)? onDateChange;
  final Function(List<DateTime>)? onWeekChange;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final Color? disabledTextColor;
  final Color? activeNavigatorColor;
  final Color? inactiveNavigatorColor;
  final Color? monthColor;
  final BorderRadiusGeometry? borderRadius;
  final ScrollPhysics? scrollPhysics;
  final bool? showNavigationButtons;
  final String? monthFormat;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialDate;
  final bool showTopNavbar;
  final double? horizontalPadding;

  CustomCalender({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor = Colors.grey,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.white,
    this.disabledTextColor = Colors.white,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.monday,
    this.borderRadius,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.showNavigationButtons = true,
    this.monthFormat,
    required this.minDate,
    required this.maxDate,
    required this.initialDate,
    this.showTopNavbar = true,
    this.horizontalPadding,
  })  : assert(minDate.isBefore(maxDate)),
        assert(
            minDate.isBefore(initialDate) && (initialDate).isBefore(maxDate)),
        super();

  @override
  State<CustomCalender> createState() => _CustomCalender();
}

class _CustomCalender extends State<CustomCalender> {
  late PageController pageController;
  final int _initialPage = 1;

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;
  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    pageController = PageController(initialPage: _initialPage);
    initCalendar();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalendar() {
    final date = widget.initialDate;
    selectedDate = widget.initialDate;

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);
    _getMorePreviousWeeks();
    _getMoreNextWeeks();
  }

  _getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks[currentWeekIndex].first;

    bool canAdd = false;
    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
      if (minusDate.add(const Duration(days: 1)).isAfter(widget.minDate)) {
        canAdd = true;
      }
    }
    if (canAdd == true) {
      listOfWeeks.add(minus7Days.reversed.toList());
    }
    setState(() {});
  }

  _getMoreNextWeeks() {
    List<DateTime> plus7Days = [];
    DateTime startFrom = listOfWeeks[currentWeekIndex].last;

    for (int index = 0; index < 7; index++) {
      DateTime addDate = startFrom.add(Duration(days: (index + 1)));
      plus7Days.add(addDate);
    }

    listOfWeeks.insert(0, plus7Days);
    currentWeekIndex = 1;
    setState(() {});
  }

  _onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  _onBackClick() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  _onNextClick() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  onWeekChange(int index) {
    if (currentWeekIndex < index) {
      // on back
    }
    if (currentWeekIndex > index) {
      // on next
    }

    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      _getMorePreviousWeeks();
    }

    if (index == 0) {
      _getMoreNextWeeks();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  bool _isReachMinimum(DateTime dateTime) {
    return widget.minDate.add(const Duration(days: -1)).isBefore(dateTime);
  }

  bool _isReachMaximum(DateTime dateTime) {
    return widget.maxDate.add(const Duration(days: 1)).isAfter(dateTime);
  }

  bool _isNextDisabled() {
    DateTime lastDate = listOfWeeks[currentWeekIndex].last;
    String lastDateFormatted = DateFormat('yyyy/MM/dd').format(lastDate);
    String maxDateFormatted = DateFormat('yyyy/MM/dd').format(widget.maxDate);
    if (lastDateFormatted == maxDateFormatted) return true;

    bool isAfter = lastDate.isAfter(widget.maxDate);
    return isAfter;
  }

  bool isBackDisabled() {
    DateTime firstDate = listOfWeeks[currentWeekIndex].first;
    String firstDateFormatted = DateFormat('yyyy/MM/dd').format(firstDate);
    String minDateFormatted = DateFormat('yyyy/MM/dd').format(widget.minDate);
    if (firstDateFormatted == minDateFormatted) return true;

    bool isBefore = firstDate.isBefore(widget.minDate);
    return isBefore;
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek.first) ==
        DateFormat('yyyy').format(today);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              if (widget.showTopNavbar)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.showNavigationButtons == true
                        ? GestureDetector(
                            onTap: isBackDisabled()
                                ? null
                                : () {
                                    _onBackClick();
                                  },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 17,
                                  color: isBackDisabled()
                                      ? (widget.inactiveNavigatorColor ??
                                          Colors.grey)
                                      : theme.primaryColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Back",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: isBackDisabled()
                                        ? (widget.inactiveNavigatorColor ??
                                            Colors.grey)
                                        : theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Text(
                      widget.monthFormat?.isEmpty ?? true
                          ? (isCurrentYear()
                              ? DateFormat('MMMM').format(
                                  currentWeek.first,
                                )
                              : DateFormat('MMMM yyyy').format(
                                  currentWeek.first,
                                ))
                          : DateFormat(widget.monthFormat).format(
                              currentWeek.first,
                            ),
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: widget.monthColor ?? theme.primaryColor,
                      ),
                    ),
                    widget.showNavigationButtons == true
                        ? GestureDetector(
                            onTap: _isNextDisabled()
                                ? null
                                : () {
                                    _onNextClick();
                                  },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: _isNextDisabled()
                                        ? (widget.inactiveNavigatorColor ??
                                            Colors.grey)
                                        : theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 17,
                                  color: _isNextDisabled()
                                      ? (widget.inactiveNavigatorColor ??
                                          Colors.grey)
                                      : theme.primaryColor,
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              Container(
                margin: const EdgeInsets.only(top: 1),
                // Provide a fixed height to constrain the PageView
                height:
                    100, // Adjust the height as per your design requirements
                child: PageView.builder(
                  reverse: true,
                  onPageChanged: onWeekChange,
                  controller: pageController,
                  physics: widget.scrollPhysics,
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfWeeks.length,
                  itemBuilder: (context, weekIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listOfWeeks[weekIndex]
                          .map(
                            (eachDate) => GestureDetector(
                              onTap: () {
                                if (_isReachMaximum(eachDate) &&
                                    _isReachMinimum(eachDate)) {
                                  _onDateSelect(eachDate);
                                }
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  borderRadius: widget.borderRadius ??
                                      BorderRadius.circular(5),
                                  color: selectedDate == eachDate
                                      ? widget.activeBackgroundColor ??
                                          theme.primaryColor
                                      : (_isReachMaximum(eachDate) &&
                                              _isReachMinimum(eachDate))
                                          ? widget.inactiveBackgroundColor ??
                                              theme.primaryColor
                                          : widget.disabledBackgroundColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: widget.horizontalPadding ?? 12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('EEE').format(eachDate),
                                      style:
                                          theme.textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: selectedDate == eachDate
                                            ? widget.activeTextColor ??
                                                theme.primaryColor
                                            : (_isReachMaximum(eachDate) &&
                                                    _isReachMinimum(eachDate))
                                                ? widget.inactiveTextColor ??
                                                    theme.primaryColor
                                                : widget.disabledTextColor,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('dd').format(eachDate),
                                      style:
                                          theme.textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: selectedDate == eachDate
                                            ? widget.activeTextColor ??
                                                theme.primaryColor
                                            : (_isReachMaximum(eachDate) &&
                                                    _isReachMinimum(eachDate))
                                                ? widget.inactiveTextColor ??
                                                    theme.primaryColor
                                                : widget.disabledTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
