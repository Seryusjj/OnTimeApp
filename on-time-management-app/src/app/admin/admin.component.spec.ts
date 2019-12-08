import {async, ComponentFixture, fakeAsync, flush, TestBed} from '@angular/core/testing';

import { AdminComponent } from './admin.component';
import {FormsModule} from '@angular/forms';
import {RouterTestingModule} from '@angular/router/testing';
import {CrudGridComponent} from '../core/components/crud-grid/crud-grid.component';
import {By} from '@angular/platform-browser';
import {UserModel} from '../core/model/user-model';
import {of} from 'rxjs';
import {AdminService} from '../core/services/admin.service';
import {Router} from '@angular/router';


describe('AdminComponent', () => {
  let component: AdminComponent;
  let fixture: ComponentFixture<AdminComponent>;

  const users = [
    {id: 0, name: 'User', surname: 'surname', email: 'usermail@swiss.com'},
    {id: 1, name: 'User1', surname: 'surname 1', email: 'usermail1@swiss.com'},
  ];

  const roles = [
    {id: 0, role: 'Administrator'},
    {id: 1, role: 'Worker'},
    {id: 2, role: 'Manager'}
  ];

  let router;
  let mockAdminService;

  beforeEach(async(() => {
    router = {
      navigate: jasmine.createSpy('navigate')
    };
    mockAdminService = {
      getRoles: jasmine.createSpy('getRoles').and.returnValue(of(roles)),
      getUsers: jasmine.createSpy('getUsers').and.returnValue(of(users)),
      removeUser: jasmine.createSpy('removeUser'),
    };

    TestBed.configureTestingModule({
      declarations: [ AdminComponent, CrudGridComponent ],
      providers: [
        {provide: AdminService, useValue: mockAdminService },
        { provide: Router, useValue: router }
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
    expect(mockAdminService.getUsers).toHaveBeenCalledTimes(1);
  });

  it('should navigate on user add event', () => {
    const crudComponentSelector = fixture.debugElement.query(By.css('#users'));
    const crudComp: CrudGridComponent<UserModel> = crudComponentSelector.componentInstance;
    crudComp.add.emit();
    expect(router.navigate).toHaveBeenCalledWith(['/Admin/NewUser']);
  });

  it('should remove user on remove event', fakeAsync(() => {
    const crudComponentSelector = fixture.debugElement.query(By.css('#users'));
    const crudComp: CrudGridComponent<UserModel> = crudComponentSelector.componentInstance;

    mockAdminService.removeUser.and.returnValue(of(true));
    crudComp.delete.emit();
    flush();

    expect(mockAdminService.removeUser).toHaveBeenCalled();
    expect(mockAdminService.getUsers).toHaveBeenCalledTimes(2);
  }));

  it('should remove user on remove event', fakeAsync(() => {
    const crudComponentSelector = fixture.debugElement.query(By.css('#users'));
    const crudComp: CrudGridComponent<UserModel> = crudComponentSelector.componentInstance;

    mockAdminService.removeUser.and.returnValue(of(false));
    crudComp.delete.emit();
    flush();

    expect(mockAdminService.removeUser).toHaveBeenCalled();
    expect(mockAdminService.getUsers).toHaveBeenCalledTimes(1);
  }));
});
