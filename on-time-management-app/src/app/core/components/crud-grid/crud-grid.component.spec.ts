import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CrudGridComponent } from './crud-grid.component';
import {By} from '@angular/platform-browser';

describe('CrudGridComponent', () => {
  let component: CrudGridComponent<any>;
  let fixture: ComponentFixture<CrudGridComponent<any>>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CrudGridComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CrudGridComponent);
    component = fixture.componentInstance;
  });

  it('should create', () => {
    component.header = 'Header';
    component.objectList = [{ val: 'Obj 1'}, { val: 'Obj 2'}];
    component.girdDisplay = (obj) => 'printer: ' + obj.val;

    fixture.detectChanges();
    expect(component).toBeTruthy();
    expect(component.objectList.length).toEqual(2);
    expect(component.header).toEqual(`Header`);

    // data + undefined
    const selection = fixture.debugElement.queryAll(By.css('tbody > tr > td'));
    expect(selection.length).toBe(2);
    const native = selection[0].nativeElement;
    expect(native.innerHTML).toContain('printer: ' + component.objectList[0].val);
  });
});
