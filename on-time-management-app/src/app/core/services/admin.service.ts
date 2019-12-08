import { Injectable } from '@angular/core';
import {UserModel} from '../model/user-model';
import {RoleModel} from '../model/role-model';
import {Observable, of } from 'rxjs';
import {delay, map} from 'rxjs/operators';
import * as _ from 'lodash';


@Injectable({
  providedIn: 'root'
})
export class AdminService {

  users: Array<UserModel>;
  roles: Array<RoleModel>;
  userRoles: Map<number, RoleModel[]>;

  constructor() {
    this.users = [
      {id: 0, name: 'User', surname: 'surname', email: 'usermail@swiss.com'},
      {id: 1, name: 'User1', surname: 'surname 1', email: 'usermail1@swiss.com'},
      {id: 2, name: 'User3', surname: 'surname 2', email: 'usermail2@swiss.com'},
      {id: 3, name: 'User4', surname: 'surname 3', email: 'usermail3@swiss.com'},
      {id: 4, name: 'User5', surname: 'surname 4', email: 'usermail4@swiss.com'},
      ];

    this.roles = [
      {id: 0, role: 'Administrator'},
      {id: 1, role: 'Worker'},
      {id: 2, role: 'Manager'}
      ];

    this.userRoles = new Map<number, RoleModel[]>();
    this.userRoles[0] = [this.roles[0], this.roles[1]];
    this.userRoles[1] = [this.roles[1]];
    this.userRoles[2] = [];
  }

  getUsers(): Observable<UserModel[]> {
    return of(this.users);
  }

  getRoles(): Observable<RoleModel[]> {
    return of(this.roles);
  }

  removeUser(user: UserModel): Observable<boolean> {
    const l = this.users.length;
    this.users = _.filter(this.users, us => us !== user);
    return of(l !== this.users.length);
  }

  removeRole(role: RoleModel): Observable<boolean> {
    const l = this.roles.length;
    this.roles = _.filter(this.roles, r => r !== role);
    return of(l !== this.roles.length);
  }


  getUser(id: number): Observable<UserModel> {
    const res: UserModel = _.find(this.users, e => e.id === id);
    return of(res);
  }

  createOrUpdate(userModel: UserModel): Observable<boolean> {
    const milisDelay = 1000;
    if (userModel.id === -1) {
      let max = -1;
      this.users.forEach((item, index) => {
        if (max < item.id) {
          max = item.id;
        }
      });
      userModel.id = max + 1;
      this.users.push(userModel);
      return of(true).pipe(delay(milisDelay));
    } else {
      this.users.forEach((item, index) => {
        if (item.id === userModel.id) {
          this.users[index] = userModel;
          return of(true).pipe(delay(milisDelay));
        }
      });
    }
    return of(false).pipe(delay(milisDelay));
  }
}
