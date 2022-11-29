abstract class HomeEvent {}

class GetDataEvent extends HomeEvent{}

class ClearListEvent extends HomeEvent{
  int id;
  ClearListEvent(this.id);
}
