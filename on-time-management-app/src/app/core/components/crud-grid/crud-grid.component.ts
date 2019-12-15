import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';

@Component({
  selector: 'app-crud-grid',
  templateUrl: './crud-grid.component.html',
  styleUrls: ['./crud-grid.component.css']
})
export class CrudGridComponent<T> implements OnInit {

  @Input()
  girdDisplay: (obj: T) => string;
  @Input()
  objectList: T[];
  @Input()
  header: string;

  @Output()
  delete: EventEmitter<T> = new EventEmitter<T>();
  @Output()
  add: EventEmitter<void> = new EventEmitter<void>();
  @Output()
  edit: EventEmitter<T> = new EventEmitter<T>();
  @Output()
  detail: EventEmitter<T> = new EventEmitter<T>();

  constructor() {
  }

  ngOnInit() {
  }

  fireDetail(item: T) {
    this.detail.emit(item);
  }

  fireDelete(item: T) {
    this.delete.emit(item);
  }

  fireEdit(item: T) {
    this.edit.emit(item);
  }

  fireAdd() {
    this.add.emit();
  }

  detailButtonClass(): string {
    const extra = this.detail.observers.length === 0 ? 'disabled' : '';
    return 'btn btn-outline-primary fa fa-eye ' + extra;
  }

  deleteButtonClass() {
    const extra = this.delete.observers.length === 0 ? 'disabled' : '';
    return 'btn btn-outline-primary fa fa-trash ';
  }

  editButtonClass() {
    const extra = this.edit.observers.length === 0 ? 'disabled' : '';
    return 'btn btn-outline-primary fa fa-edit ' + extra;
  }

  addButtonClass() {
    const extra = this.add.observers.length === 0 ? 'disabled' : '';
    return 'btn btn-outline-secondary fa fa-plus pull-right ' + extra;
  }
}
