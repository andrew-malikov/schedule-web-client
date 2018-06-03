import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:schedule_web_client/src/components/day/day_component.dart';
import 'package:schedule_web_client/src/models/day.dart';
import 'package:schedule_web_client/src/models/group.dart';
import 'package:schedule_web_client/src/services/pagination_service.dart';

@Component(
  selector: 'schedule',
  styleUrls: const ['schedule_component.css'],
  templateUrl: 'schedule_component.html',
  directives: const [CORE_DIRECTIVES, materialDirectives, DayComponent],
  providers: const [PaginationService],
)
class ScheduleComponent implements OnInit, OnChanges {
  @Input()
  List<Day> days;

  @Input()
  Group group;

  PaginationService paginator;

  @override
  ngOnChanges(Map<String, SimpleChange> changes) {
    if (changes.containsKey("days")) days = changes["days"].currentValue;
    if (changes.containsKey("group")) group = changes["group"].currentValue;
    _updatePaginator(days);
  }

  @override
  ngOnInit() {
    _setUpPagination(days);
  }

  void _setUpPagination(List<dynamic> data) {
    if (data == null) data = new List();

    paginator = new PaginationService(data, 5, 10);
  }

  void _updatePaginator(List<dynamic> data) {
    if (data == null) data = new List();

    paginator.updateData(data);
  }
}
