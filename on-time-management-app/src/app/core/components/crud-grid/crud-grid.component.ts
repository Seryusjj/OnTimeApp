import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {RoleModel} from '../../model/role-model';

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
}
