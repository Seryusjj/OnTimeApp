import {async, ComponentFixture, fakeAsync, flush, TestBed, tick} from '@angular/core/testing';

import { EditUserComponent } from './edit-user.component';
import {FormsModule} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';


describe('EditUserComponent', () => {
  let component: EditUserComponent;
  let fixture: ComponentFixture<EditUserComponent>;
  const router = {
    navigate: jasmine.createSpy('navigate')
  };
  const mockParamMap = {
    get: jasmine.createSpy('get').and.returnValue(undefined),
  };

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [FormsModule],
      declarations: [ EditUserComponent ],
      providers: [
        { provide: Router, useValue: router },
        { provide: ActivatedRoute, useValue: { snapshot: {paramMap: mockParamMap}} }
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
/*
  it('should navigate after saving', () => {
    component.save();
    expect(router.navigate).toHaveBeenCalledWith(['/Admin']);
  });
*/
  it('should navigate after saving flush', fakeAsync(() => {
    component.save();
    // flush(); we are using delay() so the clock need to role thats why use tick
    tick(1500);
    expect(router.navigate).toHaveBeenCalledWith(['/Admin']);
  }));

  it('should navigate after saving tick', fakeAsync(() => {
    component.save();
    tick(1500);
    expect(router.navigate).toHaveBeenCalledWith(['/Admin']);
  }));

});
