import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminComponent } from './admin.component';
import {FormsModule} from '@angular/forms';
import {RouterTestingModule} from '@angular/router/testing';
import {CrudGridComponent} from '../core/components/crud-grid/crud-grid.component';
import {NO_ERRORS_SCHEMA} from '@angular/core';
import {AdminService} from '../core/services/admin.service';
import {of} from 'rxjs';
import {Router} from '@angular/router';

describe('AdminComponentNoErrorSchema', () => {
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

  let mockAdminService;
  let router;

  beforeEach(async(() => {
    router = {
      navigate: jasmine.createSpy('navigate')
    };
    mockAdminService = {
      getRoles: jasmine.createSpy('getRoles').and.returnValue(of(roles)),
      getUsers: jasmine.createSpy('getUsers').and.returnValue(of(users)),
      removeUser: jasmine.createSpy('removeUser').and.returnValue(of(true)),
    };
    TestBed.configureTestingModule({
      declarations: [ AdminComponent ],
      schemas: [NO_ERRORS_SCHEMA],
      providers: [
        { provide: AdminService, useValue: mockAdminService },
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

  it('should create with NO_ERRORS_SCHEMA', () => {
    expect(component).toBeTruthy();
  });

  it('should remove with NO_ERRORS_SCHEMA', () => {
    component.deleteUser(users[0]);
    expect(mockAdminService.removeUser).toHaveBeenCalled();
  });

  it('should navigate after add with NO_ERRORS_SCHEMA', () => {
    component.addUser();
    expect(router.navigate).toHaveBeenCalledWith(['/Admin/NewUser']);
  });
});
